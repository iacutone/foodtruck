class Location
	
  include Mongoid::Document
  include Mongoid::Elasticsearch
  include Mongoid::Timestamps
  
  field :street1, type: String
  field :street2, type: String
  
  belongs_to :truck
  
end
