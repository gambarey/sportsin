require "test_helper"

class AchievementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get achievements_new_url
    assert_response :success
  end

  test "should get create" do
    get achievements_create_url
    assert_response :success
  end
end
