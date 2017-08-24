class CreateTurns < ActiveRecord::Migration[5.0]
  def change
    create_table :turns do |t|
      t.integer :game_id
      t.string :entry
      t.string :category
    end
  end
end
