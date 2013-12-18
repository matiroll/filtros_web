class CreateImagens < ActiveRecord::Migration
  def self.up
    create_table :imagens do |t|
      t.integer :id
      t.string :direccion
      t.integer :filtro

      t.timestamps
    end
  end

  def self.down
    drop_table :imagens
  end
end
