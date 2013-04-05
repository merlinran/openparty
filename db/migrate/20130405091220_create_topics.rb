class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :name
      t.integer :estimated_minutes
      t.string :detail

      t.timestamps
    end
  end
end
