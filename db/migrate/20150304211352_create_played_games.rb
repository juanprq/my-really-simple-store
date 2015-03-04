class CreatePlayedGames < ActiveRecord::Migration
  def change
    create_table :played_games do |t|
      t.integer :client_id
      t.integer :game_id

      t.timestamps
    end
  end
end
