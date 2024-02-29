class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date_of_purchase
      t.integer :quantity
      t.decimal :total_price, precision: 10, scale: 2
      t.text :shipping_address
      t.timestamps
    end
  end
end
