require "shrine/storage/s3"

s3_options = {
  access_key_id: ENV["aws_access_key_id"],
  secret_access_key: ENV["aws_secret_access_key"],
  region: ENV["aws_region"],
  bucket: ENV["aws_bucket"],
}

Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", **s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :direct_upload
Shrine.plugin :restore_cached_data
