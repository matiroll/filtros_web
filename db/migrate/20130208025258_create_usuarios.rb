class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.integer :id
      t.string :user
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
