class AddPendingToStudios < ActiveRecord::Migration
  def change
    add_column :studios, :pending, :boolean, :default => true
  end
end
