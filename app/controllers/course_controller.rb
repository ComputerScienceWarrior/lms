require './config/environment'

class CourseController < ApplicationController
    configure do
        enable :sessions unless test?
        set :session_secret, "secret"
    end
  
    get "/courses" do
        @student = Student.find_by_id(session[:student_id])
        erb :"/courses/index"
    end

    get "/courses/create" do 
        @student = Student.find_by_id(session[:student_id])
        erb :"/courses/new"
    end

    post "/courses" do
        @student = Student.find_by_id(session[:student_id])
        @course = Course.create(title: params[:title], cirriculum: params[:cirriculum], difficulty: params[:difficulty], language: params[:language], student_id: @student.id)
        erb :"/courses/show"
    end

end