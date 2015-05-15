class CreatePostSegments < ActiveRecord::Migration
  def change
    create_table :post_segments do |t|
      t.integer :post_id
      t.string :subject
      t.text :body
      t.integer :user_id
      t.boolean :visable, default: false
      t.string :image

      t.timestamps
    end
  end
end
