class User < Sequel::Model
  def password= password
    self.encrypted_password = Digest::SHA1.hexdigest password
  end

  def authorize?(password)
    Digest::SHA1.hexdigest(password) == self.encrypted_password
  end
end