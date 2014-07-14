class Location
	
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :street1, type: String
  field :street2, type: String
  field :city,    type: String
  field :state,   type: String
  
  belongs_to :truck
  
end
