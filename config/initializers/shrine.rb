require "shrine"
require "shrine/storage/s3"

s3_options ={
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  region: ENV['AWS_S3_REGION'],
  bucket: bucket: <%= ENV['S3_BUCKET_NAME'],
}

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::S3.new(prefix: "store", **s3_options), # permanent
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for forms
