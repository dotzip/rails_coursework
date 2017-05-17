class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :entity_name, null: false, limit: 64
      t.text :bank_details, null: false

      t.timestamps null: false
    end
  end
end
