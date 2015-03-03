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
#  active         :boolean          default("true")
#  email          :string
#

class Client < ActiveRecord::Base

	validates :name, :identification, :phone, :email, presence: true
	validates :identification, :phone, numericality: {only_integer: true}
  validates :email, email: true
  validates_uniqueness_of :identification, :email

	has_many :invoices

  scope :by_name, -> {order(:name)}
  scope :all_actives, -> {where(active: true)}
	
  def inactivate
    self.active = false
    save
  end

end
