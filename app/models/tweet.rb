# table name: tweets
# columns:
#  user_id: integer, not null
#  twitter_account_id: integer, not null
#  body: text
#  publish_at: datetime
#  tweet_id: string
#  created_at: datetime, not null
#  updated_at: datetime, not null
# indexes:
#  index_tweets_on_twitter_account_id: [twitter_account_id]
#  index_tweets_on_user_id: [user_id]
#
class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true

  after_initialize do
    self.publish_at ||= 24.hours.from_now
  end

  def published?
    tweet_id?
  end

  #TODO implement the following method usim a gem Twitter
  # def publish_to_twitter!
  #   tweet = twitter_account.client.update(body)
  #   update(tweet_id: tweet.id)
  # end

  def publish_to_twitter!
    tweet = twitter_account.client.post("tweets", "{\"text\":\"#{body}\"}")
    update(tweet_id: tweet["data"]["id"])
  end
end
