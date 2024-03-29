# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_05_200121) do

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
    t.integer "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "artwork_galleries", force: :cascade do |t|
    t.string "artworkGalleryTitle"
    t.text "artworkGalleryDescription"
    t.integer "artworkGalleryPosition"
    t.boolean "artworkGalleryVisibility"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "artworks", force: :cascade do |t|
    t.string "artworkTitle"
    t.text "artworkDescription"
    t.integer "artwork_gallery_id"
    t.date "artworkCreationDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.text "commentText"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
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
    t.float "latitude"
    t.float "longitude"
    t.string "latitude_reference"
    t.string "longitude_reference"
    t.string "camera_make"
    t.string "camera_model"
    t.string "original_date_time"
    t.text "address"
    t.boolean "show_on_map"
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
    t.string "slug"
    t.text "galleryQuoteText"
    t.string "galleryQuoteAuthor"
    t.string "city"
    t.index ["slug"], name: "index_photo_galleries_on_slug", unique: true
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
    t.string "colour"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "post_category_id"
    t.string "Post_Title"
    t.string "Post_Author"
    t.text "Post_Body"
    t.boolean "Post_Visibility", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "skills", force: :cascade do |t|
    t.string "skillName"
    t.integer "skillKnowledge"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
    t.boolean "subscription", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weather_stations", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
