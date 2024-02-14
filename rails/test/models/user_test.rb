require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "validations" do
    user = User.new

    assert_not user.valid?

    user.email = "user@email.com"
    assert_not user.valid?

    user.password = "password"
    assert user.valid?
  end
end
