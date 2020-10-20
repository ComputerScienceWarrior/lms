require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "password_security"
  set :views, Proc.new { File.join(root, "../views/") }

  get "/" do
    @student = Student.find_by_id(session[:user_id])
    erb :index
  end

end