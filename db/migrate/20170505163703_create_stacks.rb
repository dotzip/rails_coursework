class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.integer :number
      t.integer :places
      t.float :width
      t.float :height
      t.float :depth
      t.integer :max_total_load
      t.references :room, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
