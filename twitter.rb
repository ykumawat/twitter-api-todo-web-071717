require 'twitter'
require 'yaml'
require 'pry'

class TwitterApi
  attr_reader :client

  def initialize
    keys = YAML.load_file('application.yml')
    # binding.pry
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end
  end

  def most_recent_follower
    client.friends.first
  end

  def find_user_for(username)
    client.user(username)
  end

  def find_followers_for(user)
    client.followers(user).take(10)
  end

  def homepage_timeline
    client.home_timeline.collect do |tweet|
      tweet.text
    end
  end
end

#Bonus: 

#uncomment out the following and read the bonus instructions

# tweet_client = TwitterApi.new
# puts tweet_client.most_recent_follower
# puts tweet_client.find_user_for("sm_debenedetto")
# puts tweet_client.find_followers_for("sm_debenedetto")
# puts tweet_client.homepage_timeline
