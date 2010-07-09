module Bcms  
  module CucumberSupport
    
    def self.login_as(username)
      @current_user = User.find_by_login(username)
      User.current = @current_user
      cookies[:fake_user_id] = @current_user.id
    end    
  end
end


# so that we can login on cucumber
# class ApplicationController < ActionController::Base
#   prepend_before_filter :fake_current_user
#   def fake_current_user
#     session[:user_id] = cookies[:fake_user_id] if cookies[:fake_user_id]
#   end
# end
