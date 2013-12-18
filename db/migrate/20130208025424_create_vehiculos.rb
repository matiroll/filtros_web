class CreateVehiculos < ActiveRecord::Migration
  def self.up
    create_table :vehiculos do |t|
      t.integer :id
      t.string :modelo
      t.integer :marca
      t.integer :tipo
      t.string :desde
      t.string :hasta
      t.string :motor

      t.timestamps
    end
  end

  def self.down
    drop_table :vehiculos
  end
end
