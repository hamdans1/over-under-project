class RemoveLeagueFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :league, :string
  end
end
