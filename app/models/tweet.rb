require 'mongoid'

Mongoid.connect_to 'tweets'

class Tweet
	
  include Mongoid::Document
  include Elasticsearch::Model
  include Mongoid::Timestamps
  
  field :tweet_text, type: String
  field :time,       type: DateTime
  
  belongs_to :truck
  
  after_save :determine_location
  
  def as_indexed_json(options={})
    as_json(except: [:id, :_id])
  end
  
  def determine_location
    update = Parser.new
    update.abstract_location(self.twitter_text)
  end
  
end
