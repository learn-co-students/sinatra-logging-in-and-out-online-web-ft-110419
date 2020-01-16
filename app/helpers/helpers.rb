class Helpers

    def self.current_user(user)
        @current_user = User.find_by_id(user[:user_id])
    end 
    
    def self.is_logged_in?(user_id) 
        !!user_id
    end 
end