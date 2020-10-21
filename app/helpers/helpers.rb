class Helpers
    def self.current_user(session)
        @student = Student.find_by_id(session[:student])
    end
    
    def self.is_logged_in?(session)
        !!session[:student]
    end
end