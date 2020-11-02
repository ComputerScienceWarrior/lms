require './config/environment'

class CourseController < ApplicationController

    get "/courses" do
        @student = Student.find_by_id(session[:student_id])
        erb :"/courses/index"
    end

    get "/courses/new" do 
        @student = Student.find_by_id(session[:student_id])
        erb :"/courses/new"
    end

    post "/courses" do
        invalid_title = Helpers.title_has_invalid_chars?(params)
        empty_params = Helpers.course_has_empty_params?(params)

        @student = Student.find_by_id(session[:student_id])
        if ( invalid_title || empty_params )
            redirect "/courses/new"
        else 
            @course = Course.create(title: params[:title], cirriculum: params[:cirriculum], difficulty: params[:difficulty], language: params[:language], student_id: @student.id)
            erb :"/courses/show"
        end
    end

    get "/courses/:id/:slug" do 
        @course = Course.find_by_id(params[:id])
        @student = Student.find_by_id(session[:student_id])
        erb :"/courses/show"
    end

    get "/courses/:id/:slug/edit" do
        @course = Course.find_by_slug(params[:slug])
        @student = Student.find_by_id(session[:student_id])
        erb :"/courses/edit"
    end

    patch "/courses/:id/:slug" do
        @course = Course.find_by_slug(params[:slug])
        @course.update(title: params[:title], cirriculum: params[:cirriculum], difficulty: params[:difficulty], language: params[:language])
        redirect to "/courses/#{@course.id}/#{@course.slug}"
    end

    delete "/courses/:id/:slug" do
        @course = Course.find_by_slug(params[:slug].parameterize)
        @course.delete
        redirect to '/courses'
    end

end