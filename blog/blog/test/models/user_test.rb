require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create user" do
    user = User.new(email: "", password: "password1", username: "Username")
    assert user.save
  end

  test "create user username error" do
    user = User.new(email: "", password: "password1", username: "Username")
    user.save

    user1 = User.new(email: "", password: "password1", username: "Username")
    assert_not user1.save
  end

  test "create user password error" do
    user = User.new(email: "", password: "p", username: "Username")
    assert_not user.save
  end

  test "create user delete" do
    user = User.new(email: "", password: "password1", username: "Username")
    user.save

    user.destroy

    assert user.destroyed?
  end
end
