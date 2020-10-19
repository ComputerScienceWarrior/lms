require './config/environment'

class StudentController < ApplicationController
    configure do
        enable :sessions unless test?
        set :session_secret, "secret"
    end
  
    get '/students' do
        erb :index
    end

    get "/signup" do
        erb :"/students/new"
    end

    post "/signup" do
        @student = Student.create(firstname: params[:firstname], lastname: params[:lastname], username: params[:username], password: params[:password])
        erb :"/students/show"
    end

    get "/login" do
        erb :login
    end

    post "/login" do
        erb :login
    end
end