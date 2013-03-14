class CreateEnrolments < ActiveRecord::Migration
  def self.up
    create_table :enrolments do |t|
      t.string :nickname
      t.string :email
      t.string :comment
      t.integer :event_id

      t.timestamps
    end
  end

  def self.down
    drop_table :enrolments
  end
end
