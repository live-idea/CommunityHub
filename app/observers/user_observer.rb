class UserObserver < ActiveRecord::Observer
    def after_create(user)

     UserProfile.create(:user => user)

    end
  end