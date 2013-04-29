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

ActiveRecord::Schema.define(:version => 20120310174327) do

  create_table "beers", :force => true do |t|
    t.string   "key",                           :null => false
    t.string   "title",                         :null => false
    t.string   "synonyms"
    t.string   "web"
    t.integer  "since"
    t.boolean  "bottle",     :default => false, :null => false
    t.boolean  "draft",      :default => false, :null => false
    t.boolean  "seasonal",   :default => false, :null => false
    t.decimal  "kcal"
    t.decimal  "abv"
    t.decimal  "og"
    t.integer  "srm"
    t.integer  "brewery_id"
    t.integer  "country_id",                    :null => false
    t.integer  "region_id"
    t.integer  "city_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "bookmarks", :force => true do |t|
    t.integer  "bookmarkable_id"
    t.string   "bookmarkable_type"
    t.integer  "user_id",                              :null => false
    t.boolean  "yes",               :default => false, :null => false
    t.boolean  "no",                :default => false, :null => false
    t.boolean  "wish",              :default => false, :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "breweries", :force => true do |t|
    t.string   "key",        :null => false
    t.string   "title",      :null => false
    t.string   "synonyms"
    t.string   "address"
    t.integer  "since"
    t.integer  "closed"
    t.integer  "prod"
    t.string   "web"
    t.integer  "country_id", :null => false
    t.integer  "region_id"
    t.integer  "city_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cities", :force => true do |t|
    t.string   "title",                         :null => false
    t.string   "key",                           :null => false
    t.string   "code"
    t.string   "synonyms"
    t.integer  "country_id",                    :null => false
    t.integer  "region_id"
    t.integer  "city_id"
    t.integer  "pop"
    t.integer  "popm"
    t.integer  "area"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "m",          :default => false, :null => false
    t.boolean  "c",          :default => false, :null => false
    t.boolean  "d",          :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "continents", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "key",        :null => false
    t.string   "synonyms"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "continents", ["key"], :name => "index_continents_on_key", :unique => true

  create_table "countries", :force => true do |t|
    t.string   "title",                           :null => false
    t.string   "key",                             :null => false
    t.string   "code",                            :null => false
    t.string   "synonyms"
    t.integer  "pop",                             :null => false
    t.integer  "area",                            :null => false
    t.integer  "continent_id"
    t.integer  "country_id"
    t.boolean  "s",            :default => false, :null => false
    t.boolean  "c",            :default => false, :null => false
    t.boolean  "d",            :default => false, :null => false
    t.string   "motor"
    t.string   "iso2"
    t.string   "iso3"
    t.string   "fifa"
    t.string   "net"
    t.string   "wikipedia"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "countries", ["code"], :name => "index_countries_on_code", :unique => true
  add_index "countries", ["key"], :name => "index_countries_on_key", :unique => true

  create_table "drinks", :force => true do |t|
    t.integer  "beer_id",    :null => false
    t.integer  "user_id",    :null => false
    t.integer  "rating"
    t.text     "comments"
    t.string   "place"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "langs", :force => true do |t|
    t.string   "key",        :null => false
    t.string   "title",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "logs", :force => true do |t|
    t.string   "msg",        :null => false
    t.string   "level",      :null => false
    t.string   "app"
    t.string   "tag"
    t.integer  "pid"
    t.integer  "tid"
    t.string   "ts"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "props", :force => true do |t|
    t.string   "key",        :null => false
    t.string   "value",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "regions", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "key",        :null => false
    t.string   "code"
    t.string   "abbr"
    t.string   "iso"
    t.string   "nuts"
    t.string   "synonyms"
    t.integer  "country_id", :null => false
    t.integer  "pop"
    t.integer  "area"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "regions", ["key", "country_id"], :name => "index_regions_on_key_and_country_id", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id",        :null => false
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string   "key",                       :null => false
    t.string   "slug",                      :null => false
    t.string   "title"
    t.integer  "grade",      :default => 1, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "tags", ["key"], :name => "index_tags_on_key", :unique => true

  create_table "usages", :force => true do |t|
    t.integer  "country_id",                    :null => false
    t.integer  "lang_id",                       :null => false
    t.boolean  "official",   :default => true,  :null => false
    t.boolean  "minor",      :default => false, :null => false
    t.float    "percent"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "key",                           :null => false
    t.string   "name",                          :null => false
    t.string   "email",                         :null => false
    t.boolean  "admin",      :default => false, :null => false
    t.boolean  "guest",      :default => false, :null => false
    t.boolean  "active",     :default => true,  :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
