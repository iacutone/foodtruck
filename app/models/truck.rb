class Truck
  include Mongoid::Document
  
  field :name,         type: String
  field :twitter_name, type: String
  field :twitter_id,   type: String
  
  embeds_many :tweets
  has_many :locations
  belongs_to :user
  
  accepts_nested_attributes_for :locations, reject_if: :all_blank, allow_destroy: true
  
  def self.permitted_params
  	[
  		:name,
  		:twitter_name,
  		:twitter_id
  	]
  end
end
