# == Schema Information
#
# Table name: invoice_details
#
#  id         :integer          not null, primary key
#  quantity   :integer
#  price      :decimal(10, 2)
#  points     :integer
#  product_id :integer
#  invoice_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class InvoiceDetail < ActiveRecord::Base
end