require "shrine"
require "shrine/storage/file_system"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
}

Shrine.plugin :activerecord           # loads Active Record integration

Shrine.plugin :determine_mime_type
Shrine.plugin :validation_helpers, default_message: {
  mime_type_inclusion: -> (whitelist) {
    "is not of allowed type."
  }
}

Shrine::Attacher.validate do
  validate_mime_type_inclusion [
    'image/jpeg',
    'image/png',
    'image/gif',
  ]
  validate_max_size 1.megabyte
end