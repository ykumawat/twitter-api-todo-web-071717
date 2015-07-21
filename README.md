# Twitter API Todo

## Objective

Get more familiar with using APIs, in this case the Twitter API, in Ruby.

## Introduction

Scraping sites is one way to get data but many times, companies will expose more data through their application programming interfaces, or APIs. For this todo, we're going to focus on the [Twitter API](https://dev.twitter.com/docs/api/1.1).  You will need to add Twitter API keys in order to make the tests pass.

## Instructions
* This is a test-driven lab so just get those specs to pass! Before you begin, you need to create an application on your Twitter account at [Twitter Apps](https://apps.twitter.com/).
* Once you have created your application, you need to create an `application.yml` file in your root directory, and then add the Twitter keys to that file. The keys should be named as follows: `CONSUMER_KEY`, `CONSUMER_SECRET`, `ACCESS_TOKEN`, and `ACCESS_TOKEN_SECRET`. In order to make the access tokens, you need to navigate to the `API Keys` section of your application page, and then generate new access tokens from there.
* Additionally, you need to add your username inside of the string on line 7 inside of `spec/twitter_spec.rb`.
* If you're unsure how to format your keys in the YAML file, see the following [resource](http://docs.ansible.com/YAMLSyntax.html).
* Once you get the API keys working, then you need to make the tests pass by using the Twitter gem commands, refer to the [README](https://github.com/sferik/twitter) for the Twitter gem, or refer to the [API docs](https://dev.twitter.com/docs/api/1.1) if its unclear what the Twitter gem commands are doing.
* If you get stuck, refer to the [docs](https://dev.twitter.com/docs/api/1.1).

## Resources
* [Twitter](https://dev.twitter.com/)
