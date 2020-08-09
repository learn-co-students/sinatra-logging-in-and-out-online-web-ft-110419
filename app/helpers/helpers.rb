class Helpers
     #This method is to show current_user
  def self.current_user(session)
   # binding.pry
    User.find_by(id: session[:user_id])
     
  end
  
  def self.is_logged_in?(session)
    
      !!session[:user_id]   
  end
    
end