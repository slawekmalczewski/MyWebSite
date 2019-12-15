require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "new_post_published" do
    mail = UserMailer.new_post_published
    assert_equal "New post published", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
