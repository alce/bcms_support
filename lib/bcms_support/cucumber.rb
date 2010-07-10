require File.join(File.dirname(__FILE__), 'shared')

module BcmsSupport
  module Cucumber
    include BcmsSupport::Shared
    
    def login_as(user)
      @current_user = User.current = user
      cookies[:fake_user_id] = @current_user.id
    end    
  end
end

if defined? ApplicationController
  class ApplicationController < ActionController::Base
    prepend_before_filter :fake_current_user
    def fake_current_user
      session[:user_id] = cookies[:fake_user_id] if cookies[:fake_user_id]
    end
  end
end

World(BcmsSupport::Cucumber) if defined? World