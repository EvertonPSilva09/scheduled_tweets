# table_name = users
# columns:
#  email: string
#  password:string virtual
#  password_confirmation:string virtual
#  created_at: datetime, not null
#  updated_at: datetime, not null
# indexes:
#  index_users_on_email: [email], unique
#
class User < ApplicationRecord
  has_many :twitter_accounts
  has_many :tweets
  
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :password_confirmation, presence: true, if: -> { new_record? || !password.nil? }
end
