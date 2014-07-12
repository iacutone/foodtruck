class Truck
  include Mongoid::Document
  
  field :name,         type: String
  field :twitter_name, type: String
  field :twitter_id,   type: String
end
