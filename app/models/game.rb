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
	
end
