class CreateTrashedRecords < ActiveRecord::Migration
  def change
    create_table :trashed_records do |t|
      t.string :record_type
      t.integer :record_id
      t.string :record_content

      t.timestamps
    end
  end
end
