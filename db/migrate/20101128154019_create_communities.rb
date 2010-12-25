class CreateCommunities < ActiveRecord::Migration
  def self.up
    create_table :communities do |t|
      t.string :name
      t.text :activity
      t.string :direction
      t.string :description
      t.string :slogan
      t.boolean :is_approved
      t.boolean :is_blocked
      t.timestamps
    end
  end

  def self.down
    drop_table :communities
  end
end

