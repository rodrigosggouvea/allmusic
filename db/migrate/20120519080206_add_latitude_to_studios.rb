class AddLatitudeToStudios < ActiveRecord::Migration
  def change
    add_column :studios, :latitude, :string
  end
end
