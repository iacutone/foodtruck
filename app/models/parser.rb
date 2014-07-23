class Parser
	
	def abstract_location(tweet)
		 response = Tweet.search(query: 
		 													{ match: 
		 														{tweet_text: tweet.tweet_text}
		 														})
	end
	
end