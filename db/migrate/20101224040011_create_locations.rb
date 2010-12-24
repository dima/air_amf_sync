class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations, :id => false do |t|
      t.string :id
      t.string :name
      t.string :address_id

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end