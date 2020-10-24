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
        #ensure users can't add whatever characters they want
        badChars = ["&", ",", ".", "/", "@", "#", "$", "%", "*", "(", ")"]
        badChars.each do |bad_char|
            if params[:firstname].include?(bad_char) || params[:lastname].include?(bad_char) || params[:username].include?(bad_char)
                redirect to "/signup"
            end
        end

        #if the values are not empty, create user and show the page.
        if ((params[:firstname] != "") && (params[:lastname] != "") && (params[:username] != "") && (params[:password] != ""))
            @student = Student.create(firstname: params[:firstname].strip, lastname: params[:lastname].strip, username: params[:username].strip, password: params[:password].strip)
            session[:student_id] = @student.id
            erb :"/students/show"
        #otherwise, return user to create new user page again without making user.
        else
            erb :"/students/new"
        end
    end

    get "/login" do
        erb :login
    end

    post "/login" do
        @student = Student.find_by(username: params[:username])
        if @student && @student.authenticate(params[:password])
            session[:student_id] = @student.id
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
        @student = Student.find_by_id(session[:student_id])
        erb :"/students/show"
    end

    get "/students/:slug/edit" do
        @student = Student.find_by_id(session[:student_id])
        erb :"/students/edit"
    end

    patch "/students/:slug" do
        @student = Student.find_by_id(session[:student_id])
        @student.update(firstname: params[:firstname], lastname: params[:lastname], username: params[:username])
        erb :"/students/show"
    end

    delete "/students/:slug" do
        @student = Student.find_by_id(session[:student_id])
        Course.all.each do |course|
            if course.student_id == @student.id || course.student_id == nil
                course.delete #delete all courses associated to the student being deleted and other possible courses with no id.
            end
        end
        @student.delete #now, delete the student
        session.clear
        redirect to '/'
    end

    get "/settings" do
        @student = Student.find_by_id(session[:student_id])
        erb :"/students/settings"
    end
end