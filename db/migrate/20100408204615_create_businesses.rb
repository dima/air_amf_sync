class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses, :id => false do |t|
      t.string :id
      t.string :business_number
      t.boolean :new_business
      t.string :name
      t.string :phone
      t.string :mobile_phone
      t.string :fax
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :businesses
  end
end