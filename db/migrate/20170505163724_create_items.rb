class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :width
      t.float :height
      t.float :depth
      t.float :weight
      t.date :receipt_date
      t.integer :contract_number
      t.integer :place
      t.date :contract_expiry_date
      t.references :client, index: true, foreign_key: true
      t.references :stack, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
