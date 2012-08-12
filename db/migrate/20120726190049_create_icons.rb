class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
