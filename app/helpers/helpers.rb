class Helpers
  
  def self.current_user(session_hash)
    return User.find(session_hash[:user_id])
  end
  
  def self.is_logged_in?(session_hash)
    return !!session_hash[:user_id]
  end
  
end
