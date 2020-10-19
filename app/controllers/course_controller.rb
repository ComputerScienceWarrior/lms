require './config/environment'

class CourseController < ApplicationController
    configure do
        enable :sessions unless test?
        set :session_secret, "secret"
    end
  
    get "/courses" do
        erb :index
    end
    

end