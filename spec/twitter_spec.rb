 require_relative 'spec_helper'
 require 'pry'
 require 'vcr'

describe TwitterApi do 
  let(:client) {TwitterApi.new}

  describe "#most_recent_friend" do 
    it "returns the most recent friend" do
      VCR.use_cassette('twitter/most_recent_friend') do
        response = TwitterApi.new.most_recent_friend
        expect(response.class).to eq(Twitter::User)
      end
    end
  end

  describe "#find_user_for" do 
    it "given a username, it returns the user object" do 
      VCR.use_cassette('twitter/find_user_for') do
        reponse = TwitterApi.new.find_user_for("sm_debenedetto")
        expect(reponse.class).to eq(Twitter::User)
        expect(reponse.name).to eq("sm_debenedetto") 
      end
    end
  end

  describe "#find_followers_for" do 
    it "given a username, it returns that user's followers" do 
      VCR.use_cassette('twitter/find_followers_for') do
        reponse = TwitterApi.new.find_followers_for("sm_debenedetto")
        expect(reponse.class).to eq(Array) 
        expect(response.first.class).to eq(Twitter::User)
      end
    end
  end

  describe "#homepage_timeline" do 
    it "returns an array of tweet objects from the client user's homepage" do 
      VCR.use_cassette('twitter/homepage_timeline') do
        reponse = TwitterApi.new.find_followers_for("sm_debenedetto")
        expect(reponse.class).to eq(Array) 
        expect(response.first.class).to eq(Twitter::Tweet)
      end
    end
  end
end


# describe YourModel do
#   describe '#call_api' do
#      it &quot;gets a response from an api&quot; do
#        VCR.use_cassette 'model/api_response' do
#           response = call_api(api_url)
#           response.first.should == &quot;hello world&quot;
#        end
#      end
#   end
# end











# describe TwitterApi do

#   #configure client for test suite
#   before(:each) do 
#     binding.pry
#     stub_request(:any, /https:\/\/api.twitter.com\/*/).
#   to_return do |request| 
#       binding.pry
#       # :body => request.body
#     end

#   end

#   let(:client) { 

#     # https://api.twitter.com:443/1.1/account/verify_credentials.json?skip_status=true

#      #  stub_request(:get, "https://api.twitter.com/1.1/account/verify_credentials.json?skip_status=true").
#      #         to_return(:status => 200, :body => [{client: {
#      #   access_token: 'x911734821-Grm2qtLudgA8C9G2N5NeqNP74Q8Cdg4zgzGr02H',
#      #   access_token_secret: 'xZhz85cAJx8XZv6xxRZ0sO0ZfDsxyZS5dQJRvaKHKZFbH',
#      #   consumer_key: 'xa7msp88pvNI7GeSECqQPnK16',
#      #   consumer_secret: 'xBYW0ndkApqtW0dQiUdklPdWN9EvD614PvzHZRjQaldgIUjOR6'
#      # }}].to_json, :headers => {})
    
#     TwitterApi.new 
#   }

#   # BE SURE TO ADD YOUR USERNAME INSIDE OF THE STRING BELOW!

#   let(:user) { "YOUR USERNAME" }

#   describe '#most_recent_friend' do
#     it 'returns the most your most recent Twitter follower' do
#       binding.pry
#       # stub call for friends 
#       # stub_request(:get, "https://api.twitter.com/1.1/followers/list.json").
#       #   to_return(:status => 200, :body => "HI", :headers => {})
#       expect(client.most_recent_follower.class).to eq(Twitter::User)
#     end
#   end

#   # describe "#find_user_for" do
#   #   it 'returns the Twitter user associated with username that you passed in as a parameter' do
#   #     expect( client.find_user_for(user) ).to eq( SpecTwitterApi.new.find_user_for(user) )
#   #   end
#   # end

#   # describe "#find_followers_for" do
#   #   it 'returns 10 followers for a specific Twitter user' do
#   #     expect( client.find_followers_for(user) ).to eq( SpecTwitterApi.new.find_followers_for(user) )
#   #   end
#   # end

#   # describe "#homepage_timeline" do 
#   #   it 'returns the recent tweets from the clients homepage' do
#   #     expect( client.homepage_timeline ).to match_array(SpecTwitterApi.new.homepage_timeline)
#   #   end
#   # end



# end
