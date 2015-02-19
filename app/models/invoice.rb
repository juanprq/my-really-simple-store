# == Schema Information
#
# Table name: invoices
#
#  id           :integer          not null, primary key
#  admin_id     :integer
#  client_id    :integer
#  total        :decimal(10, 2)
#  created_at   :datetime
#  updated_at   :datetime
#  total_points :integer
#

class Invoice < ActiveRecord::Base

  belongs_to :admin
  belongs_to :client
  has_many :invoice_details

  validates :admin, :client, :invoice_details, :total, :total_points, presence: true

  before_save :calculate_total

  private
    def calculate_total
      self.total = self.invoice_details.map(&:total).reduce(&:+)
      self.total_points = self.invoice_details.map(&:total_points).reduce(&:+)
    end

end
