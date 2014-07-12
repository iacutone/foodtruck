desc 'original trucks for import'

task :truck_production => :environment do
  CSV.foreach(Rails.root.join('db', 'seeds', 'trucks.csv'), :headers => true) do |row|
    @truck = Truck.new
    @truck.name = row['name']
    @truck.twitter_name = row['twitter']
    @truck.save
  end
end