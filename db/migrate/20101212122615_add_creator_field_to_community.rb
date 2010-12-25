class AddCreatorFieldToCommunity < ActiveRecord::Migration
  def self.up
    add_column :communities, :creator_user_id, :integer
  end

  def self.down
    remove_column :communities, :creator_user_id
  end
end
