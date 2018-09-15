require 'test_helper'

class PhotoGalleriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get photo_galleries_index_url
    assert_response :success
  end

  test "should get new" do
    get photo_galleries_new_url
    assert_response :success
  end

  test "should get edit" do
    get photo_galleries_edit_url
    assert_response :success
  end

  test "should get show" do
    get photo_galleries_show_url
    assert_response :success
  end

  test "should get delete" do
    get photo_galleries_delete_url
    assert_response :success
  end

end
