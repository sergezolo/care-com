class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :page
      t.integer :total
      t.boolean :last_page
      t.text :notification, array: true

      t.timestamps
    end
  end
end
