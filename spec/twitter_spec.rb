require_relative 'spec_helper'
require 'pry'

describe TwitterApi do
  let(:client) { TwitterApi.new }
  # BE SURE TO ADD YOUR USERNAME INSIDE OF THE STRING BELOW!
  let(:user) { "YOUR USERNAME" }

  before(:all) do
  encoded = "cmVxdWlyZSAndHdpdHRlcicNCnJlcXVpcmUgJ3lhbWwnDQoNCmNsYXNzIFNwZWNUd2l0dGVyQXBpDQogIGF0dHJfcmVhZGVyIDpjbGllbnQNCg0KICBkZWYgaW5pdGlhbGl6ZQ0KICAgIGtleXMgPSBZQU1MLmxvYWRfZmlsZSgnYXBwbGljYXRpb24ueW1sJykNCiAgICAjIGJpbmRpbmcucHJ5DQogICAgQGNsaWVudCA9IFR3aXR0ZXI6OlJFU1Q6OkNsaWVudC5uZXcgZG8gfGNvbmZpZ3wNCiAgICAgIGNvbmZpZy5jb25zdW1lcl9rZXkgICAgICAgID0ga2V5c1snQ09OU1VNRVJfS0VZJ10NCiAgICAgIGNvbmZpZy5jb25zdW1lcl9zZWNyZXQgICAgID0ga2V5c1snQ09OU1VNRVJfU0VDUkVUJ10NCiAgICAgIGNvbmZpZy5hY2Nlc3NfdG9rZW4gICAgICAgID0ga2V5c1snQUNDRVNTX1RPS0VOJ10NCiAgICAgIGNvbmZpZy5hY2Nlc3NfdG9rZW5fc2VjcmV0ID0ga2V5c1snQUNDRVNTX1RPS0VOX1NFQ1JFVCddDQogICAgZW5kDQogIGVuZA0KDQogIGRlZiBtb3N0X3JlY2VudF9mb2xsb3dlcg0KICAgIGNsaWVudC5mcmllbmRzLmZpcnN0DQogIGVuZA0KDQogIGRlZiBmaW5kX3VzZXJfZm9yKHVzZXJuYW1lKQ0KICAgIGNsaWVudC51c2VyKHVzZXJuYW1lKQ0KICBlbmQNCg0KICBkZWYgZmluZF9mb2xsb3dlcnNfZm9yKHVzZXIpDQogICAgY2xpZW50LmZvbGxvd2Vycyh1c2VyKS50YWtlKDEwKQ0KICBlbmQNCg0KICBkZWYgaG9tZXBhZ2VfdGltZWxpbmUNCiAgICBjbGllbnQuaG9tZV90aW1lbGluZQ0KICBlbmQNCmVuZA=="    
  decoded = Base64.decode64(encoded)
    File.open('./spec/spec_twitter_api.rb', 'w') do |file|
      file.write(decoded)
    end
    require_relative './spec_twitter_api.rb'
  end

  after(:all) do
    File.open('./spec/spec_twitter_api.rb', 'w') do |file|
      file.truncate(0)
    end
  end

  describe '#most_recent_friend' do
    it 'returns the most your most recent Twitter follower' do
      expect(client.most_recent_follower).to eq(SpecTwitterApi.new.most_recent_follower)
    end
  end

  describe "#find_user_for" do
    it 'returns the Twitter user associated with username that you passed in as a parameter' do
      expect( client.find_user_for(user) ).to eq( SpecTwitterApi.new.find_user_for(user) )
    end
  end

  describe "#find_followers_for" do
    it 'returns 10 followers for a specific Twitter user' do
      expect( client.find_followers_for(user) ).to eq( SpecTwitterApi.new.find_followers_for(user) )
    end
  end

  describe "#homepage_timeline" do 
    it 'returns the recent tweets from the clients homepage' do
      expect( client.homepage_timeline ).to match_array(SpecTwitterApi.new.homepage_timeline)
    end
  end



end
