class Truck
  
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name,         type: String
  field :twitter_name, type: String
  field :twitter_id,   type: String
  
  has_many :tweets
  has_one :location
  belongs_to :user
  
  accepts_nested_attributes_for :location, reject_if: :all_blank, allow_destroy: true
  
  validates_presence_of   :name, :twitter_name, :twitter_id
  validates_uniqueness_of :name, :twitter_name, :twitter_id
  
  def self.permitted_params
  	[
  		:name,
  		:twitter_name,
  		:twitter_id
  	]
  end
end
