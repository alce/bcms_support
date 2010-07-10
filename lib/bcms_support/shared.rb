module BcmsSupport
  module Shared
    
    TABLES_WITH_SEED_DATA = %w[connectors content_type_groups content_types group_permissions group_sections 
                              group_type_permissions group_types groups html_block_versions html_blocks pages
                              page_versions permissions section_nodes sections sites user_group_memberships 
                              users]
   
    SEEDS_PATH = File.join(File.dirname(__FILE__), '..','..','seeds')    
    
    def publish_all_pages
      Page.all.each(&:publish)
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