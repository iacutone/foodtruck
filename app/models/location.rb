class Location
  include Mongoid::Document
  
  field :street1, type: String
  field :street2, type: String
  
  belongs_to :truck
  
end
