# Twitter API Todo

## Objectives

1. Practice working with APIs.
2. Use a Ruby Gem to interact with an API.

## Introduction

In this lab, we'll be working with the [Twitter API](https://dev.twitter.com/docs/api/1.1). In order to interact with this API, Twitter requires that we sign up for an API key.

**_Note that the results of the test suite for this lab is based on the [VCR Fixtures](https://github.com/vcr/vcr) in `spec/vcr/twitter` _**

### Working with Gems

Many popular APIs, such as the Twitter API, are accompanied by Ruby gems! API gems provide libraries of code that "wrap" the functionality of the API. So, instead of having to write all of the code to request and manipulate API data, you can use a gem to do most of that work for you! In this lab, we'll be working with the [Twitter Gem](https://github.com/sferik/twitter)

### Using the `application.yml` file

In this lab, you'll be storing your API keys in an `application.yml` file. Once we learn about developing applications for the web, you'll get into the habit of storing data that should be available across your applications files in environment variables in YAML files. Another benefit of storing data like API keys and secrets in a separate file is to protect them from scary internet users. If we keep our keys in a separate file and add that file to our `.gitignore` file, that file *won't be pushed up to Github* and our secret keys and passwords will be safe from hackers!

**Top Tip:** A **`.gitignore`* file is a manifest of files that you don't want to push up to Github. To prevent certain files from being pushed up to Github, simply add them to a `.gitignore` file.

## Instructions

*Make sure you `bundle install` from the terminal in the directory of this lab to get the necessary gems!*

1. Let's get our API key! If you don't have a Twitter account, sign up for one first. Twitter, btw, is an important communication space for the tech community. You don't have to tweet about celebrities! You can follow your favorite developers and companies and learn about new technologies––not to mention share your own work and questions! Okay, now that we all have Twitter accounts, let's create a new application on Twitter to get our API keys. You can do that at [Twitter Apps](https://apps.twitter.com/). Navigate to the the `API Keys` section of your application page, and then generate the below access tokens from there.
2. Now, we need to store our API keys and tokens in our application. Create an `application.yml` file in the root directory of this lab. Add your Twitter keys to that file using the code below. You can check your YAML syntax [here](http://www.yamllint.com/).

```yaml
ACCESS_TOKEN: your token!
ACCESS_TOKEN_SECRET: your secret!
CONSUMER_KEY: your consumer token!
CONSUMER_SECRET: your consumer secret!
```

3. Now we're ready to fire up our Twitter gem.
  * Notice that the gem is being required at the top of the `twitter.rb` file with the `require 'twitter'` line.
  * Now that you have your API keys and tokens, the code below will handle your connection to the Twitter API via the client. The client handles the authentication aspect of requesting data from the API––it will make the appropriate request for us, depending on what data we want from the API, and, because it already contains our keys and secrets, it will authenticate us with the API.
  * Fill out the methods in the `twitter.rb` to use the approprate Twitter gem methods. The Twitter gem includes methods to handle common actions like finding a particular user's followers.
  * Let's go through one example together: Now that you've configured your client, you'll notice that there is an `attr_accessor` method, `client`. Since, as we discussed, the client handles our authentication with the Twitter API, any subsequent Twitter gem methods will need to be called on `client`.
  * Let's take a look at the example method below:

  ```ruby
  # hypothetical method in twitter.rb

  def get_friends
  end
  ```

  * According to the [documentation](https://github.com/sferik/twitter) for the Twitter gem, there is a method, `.friends`, that we can call on our configered client (stored in the `client` getter method). Thus, we can request a list of the client's friends from the Twitter API like this:

  ```ruby
def get_friends
   client.friends
end
  ```
  * To get these tests passing, use the example above and the [documentation](https://github.com/sferik/twitter) for the Twitter gem, or refer to the [API docs](https://dev.twitter.com/docs/api/1.1) if its unclear what the Twitter gem commands are doing. This lab is test-driven, so use the spec file and the above resources to get the tests passing. This lab is designed to help you get comfortable navigating the documentation of an API gem. So, don't get frustrated if you don't know the gem methods you need to employ for each test. We haven't taught them to you! Instead, we are letting you know the desired *behavior*, and you are using the gem's documentation to help you find the right tools.

### Bonus

Let's actually play around with the data that we've been retrieving from Twitter!

**First, go to `spec/spec_helper.rb` and comment out the following line:**

```ruby
WebMock.disable_net_connect!(allow_localhost: true)
```

**Advanced:** The test suite uses a gem called WebMock to fake calls to the Twitter API. This allows you to run your test suite again and again without hitting the API rate limit and it allows us to test your code remotely without relying on your super-secret API keys, which will not be pushed up to git hub. In order for you to complete the bonus challenge and play around with real web requests to the Twitter API, we have to disable WebMock and re-enable your programs ability to make web requests. **You must add the above line back into `spec_helper` before you push up your code and open a PR. OTHERWISE YOUR CODE WILL NOT PASS THE REMOTE BUILD.**

* To learn more about how this particular test suite runs, you can check out the [VCR gem](https://github.com/vcr/vcr).

1. Un-comment out the lines on the bottom of the `twitter.rb` file. Add your own twitter username to the arguments of the appropriate methods. Then, run `ruby twitter.rb` in your terminal. You'll notice that the methods you've written are returning actual User or Tweet objects from the API. Let's get these objects to show us something useful.

2. The Twitter gem gives us a `.name` method that we can call on a user. Edit your first three methods (the ones that return User objects) to return the *name* of the users.

3. The Twitter gem gives us a `.text` method that we can call on a tweet. Edit the `homepage_timeline` method to iterate over the list of tweets and collect and array of the *text* of each tweet.

4. Run the file again. This time, you'll see actual user names and tweets output to your terminal.

You did it! Don't forget to un-comment out `WebMock.disable_net_connect!(allow_localhost: true)` in the `spec_helper.rb` file before pushing up your code!

## Resources
* [Twitter](https://dev.twitter.com/)
* [Twitter Gem](https://github.com/sferik/twitter)
