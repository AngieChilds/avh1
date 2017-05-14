class CreateComps < ActiveRecord::Migration[5.0]
  def change
    create_table :comps do |t|
      t.string :name
      t.string :ref_player
      t.integer :foo
      t.string :text
      t.datetime :startdate
      t.datetime :enddate
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
