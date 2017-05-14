class AddColumnToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :failed, :integer, default: 0
  end
end
