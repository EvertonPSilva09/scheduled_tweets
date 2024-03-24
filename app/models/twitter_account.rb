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
  has_many :tweets, dependent: :destroy
  belongs_to :user

  validates :user_name, uniqueness: true

  ## TODO: try to implement the following method usim a gem Twitter
  # def client
  #   Twitter::REST::Client.new do |config|
  #     config.consumer_key = Rails.application.credentials.dig(:twitter, :api_key)
  #     config.consumer_secret = Rails.application.credentials.dig(:twitter, :api_secret)
  #     config.access_token = token
  #     config.access_token_secret = secret
  #   end
  # end

  def client
    x_credentials = {
      api_key: Rails.application.credentials.dig(:twitter, :api_key),
      api_key_secret: Rails.application.credentials.dig(:twitter, :api_secret),
      access_token: token,
      access_token_secret: secret,
    }
    X::Client.new(**x_credentials)
  end
end
