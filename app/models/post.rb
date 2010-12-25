class Post < ActiveRecord::Base
  has_many :comments, :as=> :commentable

  belongs_to :community
  belongs_to  :user
end
