class Usuario < ActiveRecord::Base
  def password_matches?(password_to_match)
    self.password == Digest::MD5.hexdigest(self.salt + password_to_match)
  end  
end