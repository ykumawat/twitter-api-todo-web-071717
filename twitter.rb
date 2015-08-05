require 'twitter'
require 'yaml'

class TwitterApi
  attr_reader :client

  def initialize
    keys = YAML.load_file('application.yml')
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end
  end

  def most_recent_friend
    #find the twitter gem method that retrieves a user's friends and grab the most recent friend
  end

  def find_user_for(username)
    #find the twitter gem method that finds the user, given a username
  end

  def find_followers_for(user)
    #find the twitter gem method that finds the followers of a particular user
  end

  def homepage_timeline
    #find the twitter gem method that retreives the tweets from a user's timeline.
  end
end

# #Bonus: 

# #uncomment out the following and read the bonus instructions

# tweet_client = TwitterApi.new
# puts tweet_client.most_recent_friend
# puts tweet_client.find_user_for("USERNAME HERE")
# puts tweet_client.find_followers_for("USERNAME HERE")
# puts tweet_client.homepage_timeline
