class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.datetime :started_playing
      t.integer :score
      t.integer :time_spent
      t.integer :player_id

      t.timestamps
    end
  end
end
