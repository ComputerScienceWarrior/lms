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
        if (params[:title].include?("&"))
            redirect "/courses/new"
        else 
            @course = Course.create(title: params[:title], cirriculum: params[:cirriculum], difficulty: params[:difficulty], language: params[:language], student_id: @student.id)
            erb :"/courses/show"
        end
    end

    get "/courses/:slug" do 
        @course = Course.find_by_slug(params[:slug].parameterize) #find the course by it's slug
        @student = Student.find_by_id(session[:student_id])
        erb :"/courses/show"
    end

    get "/courses/:slug/edit" do
        @course = Course.find_by_slug(params[:slug])
        @student = Student.find_by_id(session[:student_id])
        erb :"/courses/edit"
    end

    patch "/courses/:slug" do
        @course = Course.find_by_slug(params[:slug])
        @course.update(title: params[:title], cirriculum: params[:cirriculum], difficulty: params[:difficulty], language: params[:language])
        redirect to "/courses/#{@course.slug}"
    end

    delete "/courses/:slug" do
        @course = Course.find_by_slug(params[:slug].parameterize)
        @course.delete
        redirect to '/courses'
    end

end