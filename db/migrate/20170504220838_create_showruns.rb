class CreateShowruns < ActiveRecord::Migration[5.0]
  def change
    create_table :showruns do |t|
      t.string :other_player
      t.string :spec_vote
      t.integer :event
      t.string :make_other
      t.integer :amt
      t.string :level_to_make
      t.references :showblog, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
