class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.integer :number, null: false
      t.integer :places, null: false
      t.float :width, null: false
      t.float :height, null: false
      t.float :depth, null: false
      t.integer :max_total_load, null: false
      t.references :room, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
