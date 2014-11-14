class Parser
	
	# def stats(tweet)
 #    client = Elasticsearch::Client.new
 #    client.indices.create index: 'twitter',
 #                      body: {
 #                        mappings: {
 #                          tweet: {
 #                            properties: {
 #                               text: {
 #                               type: 'string',
 #                               term_vector: 'with_positions_offsets_payloads'
 #                             } 
 #                           }
 #                         }
 #                       }
 #                     }
 #    client.index index: 'twitter', type: 'tweet', id: '1', body: { text: 'twitter test test test' }
 #    client.index index: 'twitter', type: 'tweet', id: '2', body: { text: 'another twitter test' }
 #    client.termvector index: 'twitter', type: 'tweet', id: '1'
	# end
  
  def frequency(twitter)
    response = 
      Tweet.search(query: 
                    {  match: {
                        tweet_text: twitter.tweet_text
                    }
                  })
    
    responses = []
    responses << response.results.map { |r| r.tweet_text.gsub(/a|the/i, '').strip }
  end
	
end