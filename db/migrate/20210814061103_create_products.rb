class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id, foreign_key: true , null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :image_id, null: false
      t.integer :price, null: false
      t.integer :sales_status, default: 0, null: false

      t.timestamps
    end
  end
end
