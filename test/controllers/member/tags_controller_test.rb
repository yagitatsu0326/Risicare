require 'test_helper'

class Member::TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get member_tags_show_url
    assert_response :success
  end

  test "should get index" do
    get member_tags_index_url
    assert_response :success
  end

end
