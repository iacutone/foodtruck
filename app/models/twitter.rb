require 'mongoid'
require 'elasticsearch/model'

Mongoid.connect_to 'twitter'

# Elasticsearch::Model.client = Elasticsearch::Client.new host: 'localhost:9250', log: true

class Twitter
	
  include Mongoid::Document
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Mongoid::Timestamps
  
  field :tweet_text, type: String
  field :tweet_time, type: DateTime
  field :approved,   type: Boolean, default: false
  
  belongs_to :truck
  
  after_save :determine_location
  
  def as_indexed_json(options={})
    as_json(except: [:id, :_id])
  end
  
  def determine_location
    update = Parser.new
    update.stats(self)
    update.frequency(self)
  end

end

Tweet.import