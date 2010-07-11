## BcmsSupport

BcmsSupport is a small but growing set of methods that aims to make testing BrowserCMS modules easier, particularly functional and integration tests.

## Installation

    gem install bcms_support

## Setup

### ActiveSupport::TestCase
  
Edit config/environments/test.rb

    config.gem "bcms_support"
    
Edit test/test_helper.rb

    require "bcms_support"
    
    class ActiveSupport::TestCase
      include BcmsSupport::Test
    end
    
### Rspec

Edit config/environments/test.rb

    config.gem "bcms_support"
    
Edit spec/spec_helper.rb

    require "bcms_support"
    
    class ActiveSupport::TestCase
      include BcmsSupport::Test
    end
    
### Cucumber

Edit config/environments/cucumber.rb

    config.gem "bcms_support"
    
Edit features/support/env.rb

    require "bcms_support/cucumber"

## Usage

At the moment, this library only provides 3 methods that can be called from Test cases, Example groups or step definitions.
Please note that BcmsSupport is *very* young and as the collection of methods grow, the API may also change dramatically.

*seed\_bcms\_data* => loads all data seeded by BrowserCMS' migrations into your test database.
*login/_as(user)* => Simulates a logged in user by setting session[:user_id] to the passed in user's id.
*publish\_all\_pages* => Page.all.each(:&publish)
  
Example:

    class BlogControllerTest < ActionController::TestCase

      def setup
        seed_bcms_data
        login_as(some_user)
      end
      #...
    end
      
Or, if you are using Rspec:

    describe BlogControler do
    
      before(:all) { seed_bcms_data } 
      before(:each) { login_as(some_user) }
      #...
    end
    
Lastly, they can be used on step definitions as well:

    Given /^All BrowserCMS' seed data exists$/ do
      seed_bcms_data
    end
    
    Given /^I am logged in as "([^"]*)"$/ do |name|
      # login_as expects a user object
      login_as(Factory(:user, :name => name))
    end

## Development

BcmsSupport is in it's infancy and under heavy development. The idea is to extract data, methods and step definitions that deal with BrowserCMS itself
and are commonly used across different modules.

Ideas and contributions are more than welcome.

## Copyright

Copyright (c) 2010 Juan Alvarez. See LICENSE for details.