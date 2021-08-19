class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.boolean :active, default: true
      t.decimal :total_cart_price

      t.timestamps
    end
    add_index :carts, :user_id
  end
end
