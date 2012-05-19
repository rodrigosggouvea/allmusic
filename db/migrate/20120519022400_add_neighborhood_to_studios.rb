class AddNeighborhoodToStudios < ActiveRecord::Migration
  def change
    add_column :studios, :neighborhood, :string
  end
end
