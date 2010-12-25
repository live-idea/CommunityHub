class CreateAnnouncements < ActiveRecord::Migration
  def self.up
    create_table :announcements do |t|
      t.string :name
      t.text :description
      t.date :date
      t.string :place
      t.string :place_long
      t.integer :community_id
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :announcements
  end
end
