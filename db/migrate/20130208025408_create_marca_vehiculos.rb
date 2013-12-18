class CreateMarcaVehiculos < ActiveRecord::Migration
  def self.up
    create_table :marca_vehiculos do |t|
      t.integer :id
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :marca_vehiculos
  end
end
