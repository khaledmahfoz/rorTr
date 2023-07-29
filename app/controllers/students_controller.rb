class StudentsController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]
    before_action :set_student, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update]

    def index
        @students = Student.all
    end

    def new 
        @student = Student.new
    end


    def show
    end 


    def edit
    end

    def update
        if @student.update(student_params)
            flash[:notice] = "updated info saved!"
            redirect_to student_path(@student.id)
        else
            render "edit"
        end
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            flash.now[:notice] = "Signed up sucessfully"
            redirect_to  student_path(@student.id)
        else
            render "new"
        end
    end

    private

    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:name, :email, :password, :password_confirmation) 
    end

    def require_same_user
        if current_user != @student
           redirect_to root_path 
        end
    end

end
  