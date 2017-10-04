class CreateCompUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :comp_users, id: false do |t|
      t.references :comp, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
