class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.string :place, :place_long, :place_latt
      t.timestamps
      t.integer :community_id
    end
  end

  def self.down
    drop_table :events
  end
end
