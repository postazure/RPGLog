class CreateGroupInvites < ActiveRecord::Migration
  def change
    create_table :group_invites do |t|
      t.integer :group_id
      t.text :message
      t.integer :user_id

      t.timestamps
    end
  end
end
