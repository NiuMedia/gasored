class Feature < ActiveRecord::Base
  attr_accessible :nombre
  has_and_belongs_to_many :gas_stations
end
