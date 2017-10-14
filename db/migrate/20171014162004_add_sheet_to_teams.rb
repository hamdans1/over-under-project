class AddSheetToTeams < ActiveRecord::Migration
  def change
    add_reference :teams, :sheet, index: true, foreign_key: true
  end
end
