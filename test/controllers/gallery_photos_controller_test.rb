require 'test_helper'

class GalleryPhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gallery_photos_index_url
    assert_response :success
  end

  test "should get new" do
    get gallery_photos_new_url
    assert_response :success
  end

  test "should get edit" do
    get gallery_photos_edit_url
    assert_response :success
  end

  test "should get delete" do
    get gallery_photos_delete_url
    assert_response :success
  end

  test "should get show" do
    get gallery_photos_show_url
    assert_response :success
  end

end
