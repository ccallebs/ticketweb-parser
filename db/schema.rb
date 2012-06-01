# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120531224218) do

  create_table "attractions", :force => true do |t|
    t.integer  "sequence"
    t.string   "artist_name"
    t.integer  "artist_id"
    t.decimal  "billing"
    t.string   "links"
    t.integer  "event_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "events", :force => true do |t|
    t.integer  "ticketweb_event_id"
    t.string   "facebook_event_id"
    t.string   "name"
    t.string   "description",             :limit => 2000
    t.string   "url"
    t.string   "tags"
    t.string   "timezone"
    t.string   "status"
    t.string   "additional_listing_text"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "on_sale_date"
    t.string   "event_image_url_large"
    t.string   "event_image_url_small"
    t.decimal  "price_low"
    t.decimal  "price_high"
    t.decimal  "price_display"
    t.integer  "venue_id"
    t.integer  "ticketweb_venue_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "venues", :force => true do |t|
    t.integer  "ticketweb_venue_id"
    t.string   "name"
    t.string   "url"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.string   "address"
    t.string   "twitter_id"
    t.string   "venue_image_large"
    t.string   "venue_image_small"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
