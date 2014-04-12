class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :comment
      t.integer :entry_id

      t.timestamps
    end
  end
end
