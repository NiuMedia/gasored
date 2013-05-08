class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
