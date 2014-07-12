class Tweet
  include Mongoid::Document
  
  field :tweet_text, type: String
  field :time,       type: DateTime
  fieil :lat,        type: String
  field :long,       type: String
end
