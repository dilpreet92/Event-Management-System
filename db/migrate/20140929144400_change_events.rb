class ChangeEvents < ActiveRecord::Migration
  def change
    change_column_default :events, :status, true
    change_column :events, :start_date, :date
    change_column :events, :end_date, :date
  end
end
