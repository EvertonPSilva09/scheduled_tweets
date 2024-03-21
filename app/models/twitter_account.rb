class TwitterAccount < ApplicationRecord
  belongs_to :user

  validates :user_name, uniqueness: true
end
