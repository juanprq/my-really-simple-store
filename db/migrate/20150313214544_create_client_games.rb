class CreateClientGames < ActiveRecord::Migration
  def change
    create_table :client_games do |t|
      t.integer :client_id
      t.integer :game_id

      t.timestamps
    end
  end
end
