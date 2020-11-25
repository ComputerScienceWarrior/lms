require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "password_security"
  set :views, Proc.new { File.join(root, "../views/") }

  helpers do
    def current_student
      @student = Student.find_by_id(session[:student_id])
    end
    
    def is_logged_in?(session)
        !!session[:student_id]
    end
  end

  get "/" do
    @student = Student.find_by_id(session[:student_id])
    erb :index
  end

end