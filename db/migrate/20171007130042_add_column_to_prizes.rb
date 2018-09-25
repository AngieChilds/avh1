class AddColumnToPrizes < ActiveRecord::Migration[5.0]
  def change
    add_column :prizes, :prize_type, :string
  end
end
