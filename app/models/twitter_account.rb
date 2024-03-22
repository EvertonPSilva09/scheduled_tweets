class TwitterAccount < ApplicationRecord
  has_many :tweets
  belongs_to :user

  validates :user_name, uniqueness: true
end
