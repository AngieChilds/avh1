class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :text
      t.integer :amount
      t.references :comp, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
