class Asset < Sequel::Model
  mount_uploader :file, AssetUploader
  many_to_one :user

  def can_be_downloaded_with?(receiver)
    self.receiver == receiver
  end
end