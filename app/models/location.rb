class Location
  include Mongoid::Document
  
  field :street1, type: String
  field :street2, type: String
end
