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

ActiveRecord::Schema.define(:version => 20100810224657) do

  create_table "campgrounds", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "town"
    t.string   "postal_code"
    t.integer  "region_id"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campsites", :force => true do |t|
    t.integer  "length"
    t.integer  "width"
    t.integer  "amps"
    t.boolean  "water"
    t.boolean  "sewer"
    t.boolean  "cable"
    t.integer  "campground_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.string   "abbr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.string   "abbr"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", :force => true do |t|
    t.date     "arrival_at"
    t.date     "departure_at"
    t.integer  "campsite_id"
    t.integer  "vehicle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehicles", :force => true do |t|
    t.integer  "length"
    t.integer  "width"
    t.integer  "amps"
    t.boolean  "water"
    t.boolean  "sewer"
    t.boolean  "cable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
