require './config/environment'

class CourseController < ApplicationController
    configure do
        enable :sessions unless test?
        set :session_secret, "secret"
    end
  
    get "/courses" do
        erb :"/courses/index"
    end

    get "/courses/create" do 
        erb :"/courses/new"
    end

    post "/courses" do
        erb :"/courses/show"
    end

end