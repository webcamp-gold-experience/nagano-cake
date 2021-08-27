class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :order_id, foreign_key: true , null: false
      t.integer :product_id, foreign_key: true , null: false
      t.integer :tax_price,  null: false
      t.integer :amount,  null: false
      t.integer :production_status, default: 0,  null: false

      t.timestamps
    end
  end
end
