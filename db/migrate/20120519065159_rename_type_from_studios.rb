class RenameTypeFromStudios < ActiveRecord::Migration
  def up
    rename_column :studios, :type, :tipo
  end

  def down
      rename_column :studios, :tipo, :type
  end
end
