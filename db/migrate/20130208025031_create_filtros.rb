class CreateFiltros < ActiveRecord::Migration
  def self.up
    create_table :filtros do |t|
      t.integer :id
      t.string :codigo
      t.float :diametro_exterior
      t.float :diametro_interior
      t.float :peso
      t.float :altura
      t.float :rosca
      t.float :largo
      t.float :ancho
      t.integer :tipo
      t.text :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :filtros
  end
end
