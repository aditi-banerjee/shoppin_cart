class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :cart_id
      t.boolean :is_placed , default: true

      t.timestamps
    end
    add_index :orders, :user_id
    add_index :orders, :cart_id
  end
end
