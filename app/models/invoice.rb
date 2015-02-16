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

  belongs_to :admin
  belongs_to :client
  has_many :invoice_details

  validates :admin, :client, :total, presence: true

  before_save :calculate_total

  private
    def calculate_total
      
    end

end
