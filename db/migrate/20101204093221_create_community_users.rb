class CreateCommunityUsers < ActiveRecord::Migration
  def self.up
    create_table :community_users do |t|
      t.integer :community_id
      t.integer :user_id
      t.boolean :is_approved
      t.boolean :is_communityadmin
      t.boolean :is_communitymember
      t.timestamps
    end
  end

  def self.down
    drop_table :community_users
  end
end
