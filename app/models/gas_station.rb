class GasStation < ActiveRecord::Base
  attr_accessible :direccion, :foto1, :latitud, :longitud, :nombre, :telefono
  has_and_belongs_to_many :features
end
