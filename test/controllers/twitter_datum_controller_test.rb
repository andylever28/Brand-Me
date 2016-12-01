require 'test_helper'

class TwitterDatumControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get twitter_datum_new_url
    assert_response :success
  end

  test "should get create" do
    get twitter_datum_create_url
    assert_response :success
  end

  test "should get edit" do
    get twitter_datum_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get twitter_datum_destroy_url
    assert_response :success
  end

end
