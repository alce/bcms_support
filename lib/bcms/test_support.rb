module Bcms
  module TestSupport

    TABLES_WITH_SEED_DATA = %w[connectors content_type_groups content_types group_permissions group_sections 
                              group_type_permissions group_types groups html_block_versions html_blocks pages
                              page_versions permissions section_nodes sections sites user_group_memberships 
                              users]
   
    SEEDS_PATH = File.join(File.dirname(__FILE__), '..', '..', 'seeds')
    
    def login_as(user)
      @request.session[:user_id] = user ? user.id : nil
    end
    
    def seed_bcms_data
      TABLES_WITH_SEED_DATA.each do |t|
        ActiveRecord::Base.transaction do 
          YAML.load_file(SEEDS_PATH + "/#{t}.yml").each do |f|
            sql =  "INSERT INTO #{t} (#{f.keys.join(",")})"
            sql << "VALUES (#{f.values.map { |v| ActiveRecord::Base.connection.quote(v) }.join(",")})"
            ActiveRecord::Base.connection.execute(sql) 
          end        
        end         
      end
    end
  end
end