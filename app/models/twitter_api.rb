class TwitterApi
	
attr_reader :initiate_client

def initialize
	@initiate_client = 
		Twitter::REST::Client.new do |config|
	    config.consumer_key = ENV['TWITTER_KEY']
	    config.consumer_secret = ENV['TWITTER_SECRET']
	    config.access_token  = ENV['TWITTER_OATH_TOKEN']
	    config.access_token_secret = ENV['TWITTER_OATH_TOKEN_SECRET']
	  end
end
	
	def find_user(name)
		client = initiate_client
		client.user(name)
	end
end