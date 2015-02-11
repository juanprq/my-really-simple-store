class CreateInvoiceDetails < ActiveRecord::Migration
  def change
    create_table :invoice_details do |t|
      t.integer :quantity
      t.decimal :price, precision: 10, scale: 2
      t.integer :points
      t.integer :product_id
      t.integer :invoice_id

      t.timestamps
    end
  end
end
