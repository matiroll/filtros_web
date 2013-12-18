class CreateEquivalencias < ActiveRecord::Migration
  def self.up
    create_table :equivalencias do |t|
      t.integer :id
      t.string :codigo
      t.integer :filtro
      t.string :marca

      t.timestamps
    end
  end

  def self.down
    drop_table :equivalencias
  end
end
