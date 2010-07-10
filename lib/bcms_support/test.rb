require File.join(File.dirname(__FILE__), 'shared')

module BcmsSupport
  module Test
    include BcmsSupport::Shared

    def login_as(user)
      @request.session[:user_id] = user ? user.id : nil
    end
  end
end