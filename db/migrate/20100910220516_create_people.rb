class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people, :id => false do |t|
      t.string :id
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end