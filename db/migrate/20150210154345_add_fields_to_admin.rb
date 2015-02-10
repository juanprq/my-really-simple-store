class AddFieldsToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :name, :string
    add_column :admins, :identification, :string
    add_column :admins, :phone, :string
  end
end
