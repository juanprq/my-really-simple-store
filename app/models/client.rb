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
	validates_format_of :identification, :phone, with: /[0-9]+/, message: 'Solo se aceptan valores numericos'

	has_many :invoices

  scope :by_name, -> {order(:name)}
	
end
