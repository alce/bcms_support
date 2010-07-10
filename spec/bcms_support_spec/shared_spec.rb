require File.join(File.dirname(__FILE__), '..', 'spec_helper')
require 'bcms_support/shared'

describe BcmsSupport::Shared do
  include BcmsSupport::Shared
  
  describe "#seed_bcms_data" do
    class HtmlBlockVersion < ActiveRecord::Base; end
    class PageVersion < ActiveRecord::Base; end
    
    before(:all) { seed_bcms_data }
  
    it "should seed all bcms seed data" do
      Connector.count.should == 3
    end
    
    it "should seed content type groups" do
      ContentTypeGroup.count.should == 2
    end
    
    it "should seed content types" do
      ContentType.count.should == 7
    end
    
    it "should seed group permissions" do
      GroupPermission.count.should == 3
    end
    
    it "should seed group sections" do
      GroupSection.count.should == 6
    end
    
    it "should seed group type permissions" do
      GroupTypePermission.count.should == 2
    end
    
    it "should seed group types" do
      GroupType.count.should == 3
    end
  
    it "should seed group type permissions" do
      Group.count.should == 3
    end
    
    it "should seed group html block versions" do
      HtmlBlockVersion.count.should == 3
    end
    
    it "should seed group html blocks" do
      HtmlBlock.count.should == 3
    end
    
    it "should seed page versions" do
      PageVersion.count.should == 7
    end
    
    it "should seed pages" do
      Page.count.should == 4
    end
    
    it "should seed permissions" do
      Permission.count.should == 3
    end
    
    it "should seed section nodes" do
      SectionNode.count.should == 5
    end

    it "should seed sections" do
      Section.count.should == 2
    end
    
    it "should seed sites" do
      Site.count.should == 1
    end
    
    it "should seed sites" do
      Site.count.should == 1
    end
    
    it "should seed user group memberships" do
      UserGroupMembership.count.should == 2
    end
    
    it "should seed users" do
      User.count.should == 1
    end
  end
end