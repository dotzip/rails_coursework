class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :entity_name
      t.text :bank_details

      t.timestamps null: false
    end
  end
end
