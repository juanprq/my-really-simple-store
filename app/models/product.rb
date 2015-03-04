# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  barcode     :string
#  price       :decimal(10, 2)
#  points      :integer
#  stock       :integer
#  photo       :string
#  created_at  :datetime
#  updated_at  :datetime
#  active      :boolean          default("true")
#

class Product < ActiveRecord::Base
  include TrasheableModel
  include PgSearch

  validates :name, :barcode, :price, :points, :stock, presence: true

  scope :by_name, -> {order(:name)}

end
