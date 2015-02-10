class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string 	:name
      t.text 	:description
      t.string 	:barcode
      t.decimal :price, precision: 10, scale: 2
      t.integer :points
      t.integer :stock
      t.string 	:photo

      t.timestamps
    end
  end
end
