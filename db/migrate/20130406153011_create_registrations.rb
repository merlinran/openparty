class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :email
      t.string :weibo
      t.string :qq
      t.text :intro
      t.string :user_id

      t.timestamps
    end
  end
end
