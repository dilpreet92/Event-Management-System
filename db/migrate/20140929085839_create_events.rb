class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.time :start_time
      t.time :end_time
      t.text :address
      t.string :city
      t.string :country
      t.integer :contact_details
      t.text :description
      t.boolean :status
      t.string :image_url

      t.timestamps
    end
  end
end
