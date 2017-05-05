class CreateShowblogs < ActiveRecord::Migration[5.0]
  def change
    create_table :showblogs do |t|
      t.string :name
      t.datetime :rundate
      t.string :spec_choice
      t.string :level_range
      t.string :note
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
