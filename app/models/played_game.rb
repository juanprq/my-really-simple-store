# == Schema Information
#
# Table name: played_games
#
#  id         :integer          not null, primary key
#  client_id  :integer
#  game_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class PlayedGame < ActiveRecord::Base
  
end
