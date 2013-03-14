class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.date :hold_at
      t.string :location
      t.string :poster_url
      t.text :detail

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
