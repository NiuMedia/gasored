class CreateFeaturesGasStationsJoin < ActiveRecord::Migration

  def self.up
	  create_table :features_gas_stations, :id => false do |t|
		  t.references :feature, :gas_station
  	end
	end
	 
	def self.down
	   drop_table :features_gas_stations
	end
end
