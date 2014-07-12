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
		Truck.all.each do |truck|
			client = initiate_client
			begin
			rescue Twitter::Error::NotFound
				
			end
		end
	end
	
end
