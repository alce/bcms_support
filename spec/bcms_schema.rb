ActiveRecord::Schema.verbose = false

begin
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
rescue ArgumentError
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")
end

ActiveRecord::Base.configurations = true
ActiveRecord::Schema.define(:version => 1) do

  create_table "connectors", :force => true do |t|
    t.integer  "page_id"
    t.integer  "page_version"
    t.integer  "connectable_id"
    t.string   "connectable_type"
    t.integer  "connectable_version"
    t.string   "container"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_type_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_types", :force => true do |t|
    t.string   "name"
    t.integer  "content_type_group_id"
    t.integer  "priority",              :default => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "group_permissions", :force => true do |t|
    t.integer "group_id"
    t.integer "permission_id"
  end

  create_table "group_sections", :force => true do |t|
    t.integer "group_id"
    t.integer "section_id"
  end

  create_table "group_type_permissions", :force => true do |t|
    t.integer "group_type_id"
    t.integer "permission_id"
  end

  create_table "group_types", :force => true do |t|
    t.string   "name"
    t.boolean  "guest",      :default => false
    t.boolean  "cms_access", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "group_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "html_block_versions", :force => true do |t|
    t.integer  "html_block_id"
    t.integer  "version"
    t.string   "name"
    t.string   "content",         :limit => 65537
    t.boolean  "published",                        :default => false
    t.boolean  "deleted",                          :default => false
    t.boolean  "archived",                         :default => false
    t.string   "version_comment"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "html_blocks", :force => true do |t|
    t.integer  "version"
    t.integer  "lock_version",                   :default => 0
    t.string   "name"
    t.string   "content",       :limit => 65537
    t.boolean  "published",                      :default => false
    t.boolean  "deleted",                        :default => false
    t.boolean  "archived",                       :default => false
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_versions", :force => true do |t|
    t.integer  "page_id"
    t.integer  "version"
    t.string   "name"
    t.string   "title"
    t.string   "path"
    t.string   "template_file_name"
    t.text     "description"
    t.text     "keywords"
    t.string   "language"
    t.boolean  "cacheable",          :default => false
    t.boolean  "hidden",             :default => false
    t.boolean  "published",          :default => false
    t.boolean  "deleted",            :default => false
    t.boolean  "archived",           :default => false
    t.string   "version_comment"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.integer  "version"
    t.integer  "lock_version",       :default => 0
    t.string   "name"
    t.string   "title"
    t.string   "path"
    t.string   "template_file_name"
    t.text     "description"
    t.text     "keywords"
    t.string   "language"
    t.boolean  "cacheable",          :default => false
    t.boolean  "hidden",             :default => false
    t.boolean  "published",          :default => false
    t.boolean  "deleted",            :default => false
    t.boolean  "archived",           :default => false
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.string   "full_name"
    t.string   "description"
    t.string   "for_module"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_nodes", :force => true do |t|
    t.integer  "section_id"
    t.string   "node_type"
    t.integer  "node_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.boolean  "root",       :default => false
    t.boolean  "hidden",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "domain"
    t.boolean  "the_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_group_memberships", :force => true do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "first_name",                :limit => 40
    t.string   "last_name",                 :limit => 40
    t.string   "email",                     :limit => 40
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expires_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "reset_token"
  end
end
