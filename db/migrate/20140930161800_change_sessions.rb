class ChangeSessions < ActiveRecord::Migration
  def change
    rename_column :sessions, :events_id, :event_id
  end
end    
