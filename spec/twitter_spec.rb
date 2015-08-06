 require_relative 'spec_helper'
 require 'pry'
 require 'vcr'

describe TwitterApi do 
  let(:client) {TwitterApi.new}

  describe "#most_recent_friend" do 
    it "returns the most recent friend" do
      VCR.use_cassette('twitter/most_recent_friend') do
        response = client.most_recent_friend
        expect(response.class).to eq(Twitter::User)
      end
    end
  end

  describe "#find_user_for" do 
    it "given a username, it returns the correct user object" do 
      VCR.use_cassette('twitter/find_user_for') do
        user = client.find_user_for("USERNAME HERE")
        expect(user.class).to eq(Twitter::User)
        expect(user.username).to eq("USERNAME HERE") 
      end
    end
  end

  describe "#find_followers_for" do 
    it "given a username, it returns that user's followers" do 
      VCR.use_cassette('twitter/find_followers_for') do
        # sbinding.pry
        response = client.find_followers_for("USERNAME HERE")
        expect(response).to be_a(Array) 
        expect(response.first.class).to eq(Twitter::User)
      end
    end
  end

  describe "#homepage_timeline" do 
    it "returns an array of tweet objects from the client user's homepage" do 
      VCR.use_cassette('twitter/homepage_timeline') do
        response = client.homepage_timeline
        expect(response).to be_a(Array) 
        expect(response.first.class).to eq(Twitter::Tweet)
      end
    end
  end
end

