require 'test_helper'

class MyPhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_photos_index_url
    assert_response :success
  end

  test "should get new" do
    get my_photos_new_url
    assert_response :success
  end

  test "should get edit" do
    get my_photos_edit_url
    assert_response :success
  end

  test "should get delete" do
    get my_photos_delete_url
    assert_response :success
  end

  test "should get show" do
    get my_photos_show_url
    assert_response :success
  end

end
