class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses, :id => false do |t|
      t.string :id
      t.string :line_one
      t.string :line_two
      t.string :city
      t.string :zip
      t.string :state
      t.string :country
      t.string :owner_id
      t.string :owner_type

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end