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
  include TrasheableModel
  include PgSearch

  pg_search_scope :search_by_all,
    against: [:name, :identification, :phone, :email],
    using: {tsearch: {any_word: true}}

	validates :name, :identification, :phone, :email, presence: true
	validates :identification, :phone, numericality: {only_integer: true}
  validates :email, email: true
  validates_uniqueness_of :identification, :email

	has_many :invoices

  scope :by_name, -> {order(:name)}

end
