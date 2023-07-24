class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :payment_method
      t.integer :status
      t.integer :postage, default: 800
      t.integer :total_price
      t.string :post_code
      t.text :address
      t.string :post_name

      t.timestamps
    end
  end
end
