class CreateExhibits < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibits do |t|
      t.references :user,               null: false, foreign_key: true
      t.string :product_name,           null: false
      t.text :product_description,      null: false
      t.integer :category_id,           null: false
      t.integer :condition_id,          null: false
      t.integer :shipping_charge_id,    null: false
      t.integer :sender_id,             null: false
      t.integer :days_to_ship_id,       null: false
      t.integer :price,                 null: false
      t.timestamps
    end
  end
end
