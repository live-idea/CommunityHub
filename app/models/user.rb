class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :community_users

  has_one :user_profile

  has_many :communities, :through=>:community_users

  has_many :own_communities, :class_name=>"Community", :foreign_key => :creator_user_id

  has_many :events

  has_many :posts

  has_many :announcements

  has_many :comments


end
