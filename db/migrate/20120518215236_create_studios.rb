class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.string :name
      t.string :description
      t.integer :type
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
