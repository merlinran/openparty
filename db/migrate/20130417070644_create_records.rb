class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :user_id
      t.string :title
      t.text :text
      t.integer :event_id

      t.timestamps
    end
  end
end
