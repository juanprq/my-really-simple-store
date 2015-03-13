# == Schema Information
#
# Table name: client_games
#
#  id         :integer          not null, primary key
#  client_id  :integer
#  game_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class ClientGame < ActiveRecord::Base

  belongs_to :client
  belongs_to :game

end
