class SalariesController < ApplicationController
    load_and_authorize_resource

    before_action :get_user

    def new
       @salary = Salary.new
    end

    def create
        @salary = Salary.new(salary_params.merge(user_id: @user.id))
        #byebug
        if @salary.save!
            redirect_to user_salary_path(@user,@salary)
        else
            render 'new'
        end
    end

    def index
        @salaries = Salary.all
        if params[:search]
            @search_term = params[:search]
            @salaries = @salaries.search_by(@search_term)
        end
    end

    def show
        @salary = Salary.find(params[:id])
    end

    def edit
        @salary = Salary.find(params[:id])
    end

    def update
        @salary = Salary.new(salary_params.merge(user_id: @user.id))
        if @salary.update(salary_params)
            redirect_to user_salary_path(@user,@salary)
        else
            render 'edit'
        end
    end

    def destroy
        @salary = Salary.find(params[:id])
        @salary.destroy
        redirect_to  user_salaries_path
    end

    private
   
    def get_user 
        @user = User.find(params[:user_id])
    end

    def salary_params
        params.require(:salary).permit(:salary_amount, :salary_date, :employee_name)
    end

end
