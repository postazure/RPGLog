class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :name
      t.string :game_class
      t.string :gender
      t.string :race
      t.string :money, default: "0"
      t.integer :exp, default: 0
      t.integer :level, default: 1

      t.timestamps
    end
  end
end
