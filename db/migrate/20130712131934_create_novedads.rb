class CreateNovedads < ActiveRecord::Migration
  def self.up
    create_table :novedads do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :novedads
  end
end
