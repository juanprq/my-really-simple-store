class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.string :image
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
