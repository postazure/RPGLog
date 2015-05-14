class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :name
      t.string :race
      t.string :money
      t.integer :exp
      t.integer :level

      t.timestamps
    end
  end
end
