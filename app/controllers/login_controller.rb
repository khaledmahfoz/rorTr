class LoginController < ApplicationController

    skip_before_action :require_user, only: [:new, :create]

    def new
    end


    def create
        student = Student.find_by(email: params[:login][:email].downcase)
        if student && student.authenticate(params[:login][:password])
            session[:student_id] = student.id
            flash[:notice] = "you have successfully logged in"
            redirect_to student
        else
            flash.now[:error] = "something went wrong"
            render "new"
        end
    end 


    def destroy
        session[:student_id] = nil
        flash[:notice] = "you have logged out"
        redirect_to root_path
    end

end
  