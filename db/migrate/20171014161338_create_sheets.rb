class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      t.references :user, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true
      t.integer :score
      t.string :name

      t.timestamps null: false
    end
  end
end
