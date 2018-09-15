require 'test_helper'

class PostAttachmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_attachments_index_url
    assert_response :success
  end

  test "should get delete" do
    get post_attachments_delete_url
    assert_response :success
  end

end
