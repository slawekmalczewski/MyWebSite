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

ActiveRecord::Schema.define(version: 2018_09_12_095635) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "my_photos", force: :cascade do |t|
    t.integer "photo_gallery_id"
    t.boolean "myPhotoVisibility", default: true
    t.integer "myPhotoPosition"
    t.string "myPhotoTitle"
    t.text "myPhotoDescription"
    t.text "myPhotoLocation"
    t.string "myPhotoISO"
    t.string "myPhotoAperture"
    t.string "myPhotoShutterSpeed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_galleries", force: :cascade do |t|
    t.string "gallerytitle"
    t.text "galleryDescription"
    t.integer "galleryPosition"
    t.boolean "galleryVisibility", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "galleryAuthor"
    t.string "country"
  end

  create_table "photos", force: :cascade do |t|
    t.text "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_categories", force: :cascade do |t|
    t.string "postcategoryname"
    t.text "PostCategory_Description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "post_category_id"
    t.string "Post_Title"
    t.string "Post_Author"
    t.text "Post_Body"
    t.boolean "Post_Visibility", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "User_FirstName", limit: 20
    t.string "User_Surname", limit: 40
    t.string "Username", limit: 25
    t.string "Email", limit: 60, default: "", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Username"], name: "index_users_on_Username"
  end

end
