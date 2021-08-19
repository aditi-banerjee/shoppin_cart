class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text   :delivery_address
      t.string :phone_number
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
