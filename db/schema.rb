# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110115011336) do

  create_table "app_servers", :force => true do |t|
    t.string   "host"
    t.string   "role"
    t.string   "server_url"
    t.datetime "heartbeat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "connections", :force => true do |t|
    t.integer  "user_id"
    t.integer  "selected_user_id"
    t.string   "selection_state"
    t.string   "action_state"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_publishings", :force => true do |t|
    t.integer  "event_id"
    t.integer  "stream_publish_post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.string   "event_type"
    t.string   "event_sub_type"
    t.integer  "response"
    t.string   "event_key",         :limit => 36
    t.string   "user_session_guid", :limit => 36
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_errors", :force => true do |t|
    t.integer  "user_id"
    t.integer  "stream_queue_id"
    t.string   "event_key"
    t.text     "action"
    t.text     "error"
    t.integer  "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "sex",                   :limit => 6
    t.date     "birthday"
    t.string   "locale",                :limit => 10
    t.string   "about_me",              :limit => 4000
    t.string   "first_name",            :limit => 55
    t.string   "last_name",             :limit => 55
    t.string   "country",               :limit => 55
    t.string   "state",                 :limit => 55
    t.string   "city",                  :limit => 55
    t.integer  "zip"
    t.integer  "facebook_friend_count"
    t.string   "pic_big"
    t.string   "pic_square"
    t.integer  "lat"
    t.integer  "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_histories", :force => true do |t|
    t.integer  "job_id"
    t.datetime "date_start"
    t.datetime "date_end"
    t.integer  "num_operations"
    t.string   "summary",        :limit => 1024
    t.string   "request_id",     :limit => 60
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.integer  "enabled"
    t.datetime "date_last_start"
    t.datetime "date_last_end"
    t.string   "last_node"
    t.integer  "duration_limit_sec"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_threads", :force => true do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.string   "subject"
    t.datetime "date_removed_by_sender"
    t.datetime "date_removed_by_receiver"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "to_user_id"
    t.integer  "from_user_id"
    t.integer  "message_thread_id"
    t.string   "content",           :limit => 4000
    t.datetime "date_viewed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notification_events", :force => true do |t|
    t.integer  "user_id"
    t.string   "event_type"
    t.string   "event_sub_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_views", :force => true do |t|
    t.integer  "user_id"
    t.string   "source"
    t.string   "destination"
    t.string   "ip",               :limit => 15
    t.text     "user_agent"
    t.string   "facebook_session"
    t.string   "event_key"
    t.integer  "facebook_id"
    t.string   "user_session_id",  :limit => 100
    t.string   "server_id",        :limit => 45
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stream_publish_contents", :force => true do |t|
    t.integer  "version"
    t.string   "type"
    t.string   "message"
    t.string   "media_name"
    t.string   "media_caption"
    t.string   "media_description"
    t.string   "media_src",         :limit => 55
    t.string   "media_action",      :limit => 55
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stream_queues", :force => true do |t|
    t.integer  "user_id"
    t.string   "published",       :limit => 1
    t.text     "stream_data"
    t.integer  "publish_attempt"
    t.integer  "to_facebook_id"
    t.string   "event_key",       :limit => 64
    t.datetime "date_completed"
    t.datetime "date_scheduled"
    t.string   "event_sub_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_params", :force => true do |t|
    t.string   "param_key"
    t.string   "param_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_permissions", :force => true do |t|
    t.integer  "user_id"
    t.string   "permission_type"
    t.string   "source"
    t.integer  "response"
    t.string   "permission_source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "sex",        :limit => 6
    t.date     "birthday"
    t.string   "seeking"
    t.string   "country"
    t.string   "city"
    t.string   "state"
    t.integer  "sync"
    t.string   "about_me",   :limit => 4000
    t.integer  "lat"
    t.integer  "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.integer  "user_id"
    t.string   "last_user_session_guid", :limit => 36
    t.string   "facebook_session",       :limit => 80
    t.string   "facebook_access_token",  :limit => 120
    t.string   "facebook_session_type",  :limit => 45
    t.datetime "date_last_connected"
    t.datetime "date_last_disconnected"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "facebook_id"
    t.string   "userguid",     :limit => 36
    t.string   "email"
    t.string   "event_key"
    t.datetime "date_removed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
