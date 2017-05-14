class CreatePrizes < ActiveRecord::Migration[5.0]
  def change
    create_table :prizes do |t|
      t.string :text
      t.references :comp, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
