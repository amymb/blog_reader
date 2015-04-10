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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150410190103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_posts", force: :cascade do |t|
    t.text    "content"
    t.text    "title"
    t.date    "date"
    t.integer "blog_id"
    t.integer "user_id"
    t.float   "flesch_kincaid_grade"
    t.integer "suggestions"
    t.integer "words_to_avoid"
    t.integer "unique_words"
    t.integer "word_count"
    t.integer "blog_post_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.string  "url"
    t.string  "description"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "email"
    t.string  "full_name"
    t.string  "password_digest"
    t.string  "wordpress_username"
    t.string  "role",               default: "Student"
    t.integer "wordpress_user_id"
  end

end
