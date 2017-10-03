class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :players, array: true
      t.decimal :total
      t.boolean :over
      t.string :league
      t.string :coach

      t.timestamps null: false
    end
  end
end
