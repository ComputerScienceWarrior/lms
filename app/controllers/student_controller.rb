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
        @student = Student.find_by(username: params[:username])
        if @student && @student.authenticate(params[:password])
            session[:user_id] = @student.id
            erb :"/students/show"
        else
            erb :login
        end
    end

    get "/logout" do
        session.clear
        redirect to '/'
    end

    get "/students/:slug" do
        @student = Student.find_by_id(session[:user_id])
        erb :"/students/show"
    end
end