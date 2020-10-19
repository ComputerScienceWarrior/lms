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
        erb :login
    end

    get "/signup" do
        erb :new
    end

    post "/signup" do
        @student = Student.create(params[:firstname], params[:lastname], params[:username], params[:password])
        binding.pry
    end
end