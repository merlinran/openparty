class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :hold_date
      t.string :location
      t.string :poster_url
      t.text :detail

      t.timestamps
    end
  end
end
