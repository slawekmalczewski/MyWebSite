class ApplicationController < ActionController::Base
  include CurrentUserConcern
  include AfterSignInConcern

  layout "application"


private


end
