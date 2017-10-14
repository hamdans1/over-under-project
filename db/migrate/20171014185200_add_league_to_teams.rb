class AddLeagueToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :league, :ref
    add_index :teams, :league
  end
end
