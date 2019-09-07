module CurrentUserConcern
  extend ActiveSupport::Concern

  # Current_user is supplied by devise and it refers only to signed_in users
  # We have to create a way to facilitate users that are not signed_in
  # Users that only visit the website, it will be done by overwriting the devise current_user
  def current_user
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end
end
