# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  image       :string
#  active      :boolean          default("true")
#  created_at  :datetime
#  updated_at  :datetime
#

class Game < ActiveRecord::Base
  include TrasheableModel
  include PgSearch

  validates :name, :image, presence: true
	
  scope :by_name, -> {order(:name)}
  pg_search_scope :search_by_all,
    against: [:name, :description],
    using: {tsearch: {any_word: true}}

end
