# == Schema Information
#
# Table name: clients
#
#  id             :integer          not null, primary key
#  name           :string
#  identification :string
#  created_at     :datetime
#  updated_at     :datetime
#  phone          :string
#

class Client < ActiveRecord::Base

	validates :name, :identification, :phone, presence: true
	validates :identification, :phone, numericality: {only_integer: true}
  validates_uniqueness_of :identification

	has_many :invoices

  scope :by_name, -> {order(:name)}
	
end
