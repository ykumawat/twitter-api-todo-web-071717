# Twitter API Todo

## Objectives

1. Practice working with APIs.
2. Use a Ruby Gem to interact with an API

## Introduction

In this lab, we'll be working with the [Twitter API](https://dev.twitter.com/docs/api/1.1). In order to interact with this API, Twitter requires that we sign up for an API key.

### Working with Gems

Many popular APIs, such as the Twitter API, are accompanied by Ruby gems! API gems provide libraries of code that "wrap" the functionality of the API. So, instead of having to write all of the code to request and manipulate API data, you can use a gem to do most of that work for you! In this lab, we'll be working with the [Twitter Gem](https://github.com/sferik/twitter)

### Using the `application.yml` file

In this lab, you'll be storing your API keys in an `application.yml` file. Once we learn about developing applications for the web, you'll get into the habit of storing data that should be available across your applications files in environment variables in YAML files. Don't worry about this for now. 

## Instructions

*Make sure you `bundle install` from the terminal in the directory of this lab to get the necessary gems!*

1. Let's get our API key! If you don't have a Twitter account, sign up for one first. Twitter, btw, is an important communication space for the tech community. You don't have to tweet about celebrities! You can follow your favorite developers and companies and learn about new technologies––not to mention share your own work and questions! Okay, now that we all have Twitter accounts, let's create a new application on Twitter to get our API keys. You can do that at [Twitter Apps](https://apps.twitter.com/). Navigate to the the `API Keys` section of your application page, and then generate the below access tokens from there.
2. Now, we need to store our API keys and tokens in our application. Create an `application.yml` file in the root directory of this lab. Add your Twitter keys to that file: 

```yaml
ACCESS_TOKEN: your token!
ACCESS_TOKEN_SECRET: your secret!
CONSUMER_KEY: your consumer token!
CONSUMER_SECRET: your consumer secret!
```

3. Add your Twitter username inside of the string on line 7 inside of `spec/twitter_spec.rb`.
4. Now we're ready to fire up our Twitter gem. 
  * Notice that the gem is being required at the top of the `twitter.rb` file with the `require 'twitter'` line. 
  * Now that you have your API keys and tokens, the code below will handle your connection to the Twitter API via the client. The client handles the authentication aspect of requesting data from the API––it will make the appropriate request for us, depending on what data we want from the API, and, because it already contains our keys and secrets, it will authenticate us with the API. 
  * Fill out the methods in the `twitter.rb` to use the approprate Twitter gem methods. The Twitter gem includes methods to handle common actions like finding a particular user's followers. Use the [documentation](https://github.com/sferik/twitter) for the Twitter gem, or refer to the [API docs](https://dev.twitter.com/docs/api/1.1) if its unclear what the Twitter gem commands are doing. This lab is test-driven, so use the spec file and the above resources to get the tests passing. 

### Bonus

Let's actually play around with the data that we've been retrieving from Twitter!

1. Un-comment out the lines on the bottom of the `twitter.rb` file. Then, run `ruby twitter.rb` in your terminal. You'll notice that the methods you've written are returning actual User or Tweet objects from the API. Let's get these objects to show us something useful. 

2. The Twitter gem gives us a `.name` method that we can call on a user. Edit your first three methods (the ones that return User objects) to return the *name* of the users. 

3. The Twitter gem gives us a `.text` method that we can call on a tweet. Edit the `homepage_timeline` method to iterate over the list of tweets and collect and array of the *text* of each tweet. 

4. Run the file again. This time, you'll see actual user names and tweets output to your terminal. 

## Resources
* [Twitter](https://dev.twitter.com/)
* Twitter Gem](https://github.com/sferik/twitter)
