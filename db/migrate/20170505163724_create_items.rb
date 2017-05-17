class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :width, null: false
      t.float :height, null: false
      t.float :depth, null: false
      t.float :weight, null: false
      t.date :receipt_date, null: false
      t.integer :contract_number, null: false
      t.integer :place, null: false
      t.date :contract_expiry_date, null: false
      t.references :client, index: true, foreign_key: true
      t.references :stack, index: true, foreign_key: true

      t.timestamps null: false
      t.index :contract_number, unique: true
        
    end
  end
end
