class CreateFiltroVehiculos < ActiveRecord::Migration
  def self.up
    create_table :filtro_vehiculos do |t|
      t.integer :id
      t.integer :vehiculo
      t.integer :filtro

      t.timestamps
    end
  end

  def self.down
    drop_table :filtro_vehiculos
  end
end
