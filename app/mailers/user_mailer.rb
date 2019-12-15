class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_post_published.subject
  #
  def new_post_published(post)
    @user = User.all
    emails = @user.collect(&:email).join(",")
    @post = post
    @greeting = "Hi, new post have been just published on my website"

    mail to: emails, subject: "SlawekPhotography - new post published"
  end
end
