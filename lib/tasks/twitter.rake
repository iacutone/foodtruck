desc 'get some tweets for food trucks'
require 'pry'
namespace :twitter do
	
	def log(msg)
		Rails.logger.info msg
	end
	
	task :update_id => :environment do
		TwitterApi.new
		
		Truck.all.each do |truck|
			begin
				tweet_array = initiate_client.user_timeline(truck.twitter_name)
				id = tweet_array.first.user.id
				truck.update_attributes(twitter_id: id)
				truck.save!
				log "Saved!"
			rescue Twitter::Error::NotFound
				log "Something went wrong saving #{truck.name}."
			end
		end
	end
	
	task :fetch_tweets => :environment do
		TwitterApi.new
		
		truck = Truck.first
		tweet_array = inititiate_client.user_timeline(truck.twitter_name)
		tweet_array.each do |t|
			tweet = truck.tweets.new
			tweet.update_attributes(time: t.created_at, tweet_text: t.full_text, twitter_id: t.id)
			tweet.save!
		end
	end
	
end
