class AddTotalPointsToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :total_points, :integer
  end
end
