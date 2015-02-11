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
#

class Product < ActiveRecord::Base
end
