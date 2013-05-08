class CreateGasStations < ActiveRecord::Migration
  def change
    create_table :gas_stations do |t|
      t.string :nombre
      t.text :direccion
      t.string :telefono
      t.float :latitud
      t.float :longitud
      t.string :foto1

      t.timestamps
    end
  end
end
