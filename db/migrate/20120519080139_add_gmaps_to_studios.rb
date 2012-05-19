class AddGmapsToStudios < ActiveRecord::Migration
  def change
    add_column :studios, :gmaps, :boolean
  end
end
