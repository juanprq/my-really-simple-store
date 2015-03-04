class AddGameToProduct < ActiveRecord::Migration
  def change
    add_column :products, :game_id, :integer
  end
end
