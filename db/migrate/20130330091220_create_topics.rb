class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.string :submitter
      t.string :poster_url
      t.integer :estimated_minutes
      t.string :detail
      t.integer :event_id

      t.timestamps
    end
  end
end
