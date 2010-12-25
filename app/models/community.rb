class Community < ActiveRecord::Base
   has_many :community_users
   has_many :events
   has_many :announcements
   has_many :posts
   has_many :users, :through => :community_users
   belongs_to :creator, :class_name => "User", :foreign_key => :creator_user_id
   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def recent_events(n)
    self.events.where("date >= ?", Date.today).order("date ASC").limit(n)

  end

  def future_events
    self.events.where("date > ?", Date.today).order("date ASC")

  end

  def past_events
    self.events.where("date < ?", Date.today).order("date DESC")

  end

  def history_events
     self.events.order("date DESC")
  end

end
