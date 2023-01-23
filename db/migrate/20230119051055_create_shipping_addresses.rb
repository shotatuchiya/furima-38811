class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code,                null: false
      t.integer :sender_id,                 null: false
      t.string :municipalitie,              null: false
      t.string :address,                    null: false
      t.string :building_name,              null: false
      t.string :telephone_number,           null: false
      t.references :purchase,               null: false, foreign_key: true
      t.timestamps
    end
  end
end