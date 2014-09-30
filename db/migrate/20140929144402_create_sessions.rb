class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :topic
      t.date :start_date
      t.time :start_time
      t.time :end_time
      t.string :location
      t.string :description
      t.string :speaker
      t.boolean :status
      t.references :events, index: true

      t.timestamps
    end
  end
end
