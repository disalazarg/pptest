class ApplicationController < ActionController::Base
  def current_user
    User.new email: 'user@example.com'
  end
end
