require 'test_helper'

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get organizations_index_url
    assert_response :success
  end

  test "should get donors" do
    get organizations_donors_url
    assert_response :success
  end

  test "should get show" do
    get organizations_show_url
    assert_response :success
  end

end
