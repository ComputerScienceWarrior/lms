class Helpers
    ################################
        # STUDENT HELPER METHODS
    ################################
    def self.current_user(session)
        @student = Student.find_by_id(session[:student_id])
    end
    
    def self.is_logged_in?(session)
        !!session[:student_id]
    end

    #takes in params hash and the route...used for all areas of program to prevent bad login information
    def self.invalid_credentials?(params)
        badChars = ["&", ",", ".", "/", "@", "#", "$", "%", "*", "(", ")", "!", "^", "_", "\\", ":", ";", "=", "+", "?"]
        badChars.each do |bad_char|
            if ( (params[:firstname].include?(bad_char)) || (params[:lastname].include?(bad_char)) || (params[:username].include?(bad_char)) )
                return true
            end
        end
        return false
    end

    def self.empty_fields?(params)
        params[:firstname] == "" || params[:lastname] == "" || params[:username] == "" || params[:password] == "" || params[:passwordconf] == "" ? true : false
    end

    def self.passwords_dont_match?(password, password_conf)
        password != password_conf ? true : false
    end

    ################################
        # COURSE HELPER METHODS
    ################################
    def self.title_has_invalid_chars?(params)
        badChars = ["&", ",", ".", "/", "@", "#", "$", "%", "*", "(", ")", "!", "^", "_", "\\", ":", ";", "=", "+", "?"]
        badChars.each do |bad_char|
            if ( (params[:title].include?(bad_char)) )
                return true
            end
        end
        return false
    end

    def course_has_empty_params?(params)
        params[:title] == "" || params[:cirriculum] == "" || params[:difficulty] == "" || params[:language] == "" || params[:student_id] == "" ? true : false
    end
end