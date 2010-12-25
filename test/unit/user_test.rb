require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
 
  test "the truth" do
    u = users(:User_one)
    
    assert_equal true,  u.is_superadmin , 'not superadmin'

  end
end
