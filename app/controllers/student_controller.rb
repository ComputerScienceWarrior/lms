require './config/environment'

class StudentController < ApplicationController
    configure do
        enable :sessions unless test?
        set :session_secret, "secret"
    end
  
    get '/students' do
        erb :index
    end

    get "/login" do
        erb :login
    end

    post "/login" do
        binding.pry
    end

    get "/signup" do
        erb :new
    end

end