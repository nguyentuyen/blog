class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.string :comment
      t.integer :entry_id

      t.timestamps
    end
    add_index :entries, [:entry_id, :created_at]
  end
end