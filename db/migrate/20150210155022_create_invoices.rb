class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :admin_id
      t.integer :client_id
      t.decimal :total, precision: 10, scale: 2

      t.timestamps
    end
  end
end
