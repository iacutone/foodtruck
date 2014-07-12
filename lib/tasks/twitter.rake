desc 'get some tweets for food trucks'
require 'pry'
namespace :twitter do
	
	def initiate_client
		client = 
			Twitter::REST::Client.new do |config|
		    config.consumer_key = ENV['TWITTER_KEY']
		    config.consumer_secret = ENV['TWITTER_SECRET']
		    config.oauth_token = ENV['TWITTER_OATH_TOKEN']
		    config.oauth_token_secret = ENV['TWITTER_OATH_TOKEN_SECRET']
		  end
	end
	
	task :update_id => :environment do
		client = initiate_client
		
		Truck.all.each do |truck|
			begin
			rescue Twitter::Error::NotFound
				tweet_array = client.user_timeline(truck.twitter_name)
				id = tweet_array.first.user.id
				truck.update_attributes(twitter_id: id)
				truck.save!
			end
		end
	end
	
	task :fetch_tweets => :environment do
		client = initiate_client
		
		truck = Truck.first
		tweet_array = client.user_timeline(truck.twitter_name)
		tweet_array.each do |t|
			tweet = truck.tweets.new
			tweet.update_attributes(time: t.created_at, tweet_text: t.full_text)
			tweet.save!
		end
	end
	
end
