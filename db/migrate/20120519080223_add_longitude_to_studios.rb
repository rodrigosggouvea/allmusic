class AddLongitudeToStudios < ActiveRecord::Migration
  def change
    add_column :studios, :longitude, :string
  end
end
