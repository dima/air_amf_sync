class AddLastFeePaid < ActiveRecord::Migration
  def self.up
    add_column :businesses, :last_fee_paid, :decimal, :precision => 12, :scale => 2, :null => false, :default => 0
  end

  def self.down
    remove_column :businesses, :last_fee_paid
  end
end
