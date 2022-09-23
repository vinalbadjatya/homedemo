class EmpAttendancesController < ApplicationController
    before_action :get_user
    def new
    @attendance = EmpAttendance.new
    end

    def index 
    @attendances = EmpAttendance.all
    if params[:search]
        @search_term = params[:search]
        @attendances=  @attendances.search_by(@search_term)
    end
    end

    def create 

     @attendance = EmpAttendance.new(attendance_params.merge(user_id: @user.id))
        if @attendance.save!
            redirect_to  user_emp_attendance_path(@user.id,@attendance)
        else
            render 'new'
        end
    end

    def show
        @attendance = EmpAttendance.find(params[:id])
    end

    def edit
        @attendance= EmpAttendance.find(params[:id])
    end

    def update
        @attendance = EmpAttendance.new(attendance_params.merge(user_id: @user.id))
            if @attendance.update(attendance_params)
                redirect_to  user_emp_attendance_path(@user,@attendance)
            else
                render 'edit'
            end
    end


    def destroy
        @attendance =  EmpAttendance.find(params[:id])
        @attendance.destroy
        redirect_to user_emp_attendances_path
    end

    private

    def get_user
        @user = User.find(params[:user_id])
    end
    

    def attendance_params
        params.require(:emp_attendance).permit(:working_hours, :project_name, :task_description, :user_id, :mail_to, :status_date)
    end
end
