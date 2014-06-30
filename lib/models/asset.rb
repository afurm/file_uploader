class Asset < Sequel::Model
  mount_uploader :file, AssetUploader
  many_to_one :user
end