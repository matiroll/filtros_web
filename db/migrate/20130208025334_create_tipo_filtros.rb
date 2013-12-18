class CreateTipoFiltros < ActiveRecord::Migration
  def self.up
    create_table :tipo_filtros do |t|
      t.integer :id
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_filtros
  end
end
