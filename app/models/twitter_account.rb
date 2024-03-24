# table_name: twitter_accounts
# columns:
#  user_id: integer, not null
#  name: string
#  user_name: string
#  image: string
#  token: string
#  secret: string
#  created_at: datetime, not null
#  updated_at: datetime, not null
# indexes:
#  index_twitter_accounts_on_user_id: [user_id]
#
class TwitterAccount < ApplicationRecord
  has_many :tweets
  belongs_to :user

  validates :user_name, uniqueness: true

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_API_KEY"]
      config.consumer_secret = ENV["TWITTER_API_SECRET"]
      config.access_token = self.access_token
      config.access_token_secret = self.access_token_secret
    end
  end
end
