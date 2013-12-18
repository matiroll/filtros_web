class CreateListaPrecios < ActiveRecord::Migration
  def self.up
    create_table :lista_precios do |t|
      t.string :file
      t.string :password
      t.date :desde
      t.date :hasta

      t.timestamps
    end
  end

  def self.down
    drop_table :lista_precios
  end
end
