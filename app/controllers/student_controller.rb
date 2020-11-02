require './config/environment'

class StudentController < ApplicationController
  
    get '/students' do
        erb :index
    end

    get "/signup" do
        erb :"/students/new"
    end

    post "/signup" do
        invalid_chars = Helpers.invalid_credentials?(params) 
        empty_fields = Helpers.empty_fields?(params)
        passwords_dont_match = Helpers.passwords_dont_match?(params[:password], params[:passwordconf])

        if (invalid_chars || empty_fields || passwords_dont_match)
            redirect '/signup'
        else
            @student = Student.create(firstname: params[:firstname].strip, lastname: params[:lastname].strip, username: params[:username].strip, password: params[:password].strip)
            session[:student_id] = @student.id #set student to logged in state
            redirect "/students/#{@student.id}/#{@student.slug}"
        end
    end

    get "/login" do
        erb :login
    end

    post "/login" do
        @student = Student.find_by(username: params[:username])
        if @student && @student.authenticate(params[:password])
            session[:student_id] = @student.id
            redirect to "/students/#{@student.id}/#{@student.slug}"
        else
            erb :login
        end
    end

    get "/logout" do
        session.clear
        redirect to '/'
    end

    get "/students/:id/:slug" do
        @student = Student.find_by_id(session[:student_id])
        erb :"/students/show"
    end

    get "/students/:id/:slug/edit" do
        @student = Student.find_by_id(session[:student_id])
        erb :"/students/edit"
    end

    patch "/students/:id/:slug" do
        @student = Student.find_by_id(session[:student_id])
        @student.update(firstname: params[:firstname], lastname: params[:lastname], username: params[:username])
        redirect "/students/#{@student.id}/#{@student.slug}"
    end

    delete "/students/:id/:slug" do
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
end