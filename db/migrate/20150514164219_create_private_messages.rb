class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.string :subject
      t.integer :from_user
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
