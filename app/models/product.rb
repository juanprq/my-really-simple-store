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
#  game_id     :integer
#

class Product < ActiveRecord::Base
  include TrasheableModel
  include PgSearch

  mount_uploader :photo, ImageUploader

  pg_search_scope :search_by_all,
    against: [:name, :description, :barcode],
    using: {tsearch: {any_word: true}}

  validates :name, :barcode, :price, :points, :stock, presence: true

  scope :by_name, -> {order(:name)}

end
