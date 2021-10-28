class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities, :id => false  do |t|
      t.belongs_to :event, null: false, foreign_key: true
      t.integer :id, :primary_key
      t.string :title
      t.boolean :drop_in
      t.boolean :indoor
      t.boolean :outdoor
      t.boolean :online
      t.string :about
      t.boolean :purchasable
      t.integer :available_spots
      t.integer :start_months_old
      t.integer :end_months_old
      t.string :instructions
      t.boolean :camp
      t.boolean :date_night
      t.boolean :day_pass
      t.boolean :drop_off
      t.boolean :allows_waitlist
      t.boolean :only_purchasable_as_trial
      t.string :unique_product_id
      t.string :currency
      t.string :link
      t.string :online_link
      t.integer :updated
      t.integer :schedule_id
      t.integer :price_integer
      t.string :price
      t.string :web_url
      t.boolean :for_kids
      t.integer :start_time
      t.integer :end_time
      t.string :start_time_iso_string
      t.string :end_time_iso_string
      t.integer :purchasable_start_time
      t.integer :purchasable_end_time
      t.text :instructors, array: true
      t.text :discounts, array: true

      t.timestamps
    end
  end
end
