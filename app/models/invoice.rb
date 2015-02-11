# == Schema Information
#
# Table name: invoices
#
#  id         :integer          not null, primary key
#  admin_id   :integer
#  client_id  :integer
#  total      :decimal(10, 2)
#  created_at :datetime
#  updated_at :datetime
#

class Invoice < ActiveRecord::Base
end
