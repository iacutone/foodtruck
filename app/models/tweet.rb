class Tweet
  include Mongoid::Document
  
  field :tweet_text, type: String
  field :time,       type: DateTime
  field :lat,        type: String
  field :long,       type: String
  
  embedded_in :truck
end
