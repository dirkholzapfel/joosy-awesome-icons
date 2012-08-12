class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :icon
      t.belongs_to :user
      t.text :text

      t.timestamps
    end
    add_index :comments, :icon_id
    add_index :comments, :user_id
  end
end
