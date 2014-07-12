class Tweet
	
  include Mongoid::Document
  include Mongoid::Elasticsearch
  include Mongoid::Timestamps
  
  elasticsearch!({
	})
  
  field :tweet_text, type: String
  field :time,       type: DateTime
  
  belongs_to :truck
end
