class Helpers
    def self.current_user(session)
        @student = Student.find_by_id(session[:student_id])
    end
    
    def self.is_logged_in?(session)
        !!session[:student_id]
    end
end