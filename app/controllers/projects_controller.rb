class ProjectsController < ApplicationController

    load_and_authorize_resource

    before_action :get_user

    def new
       @project = Project.new
    end

    def create
       @project = current_user.projects.new(project_params.merge(user_id: @user.id))
        #byebug
        if @project.save!
            redirect_to user_project_path(@user,@project)
        else
            render 'new'
        end
    end

    def index
       @projects = Project.all
        if params[:search]
            @search_term = params[:search]
            @projects = @projects.search_by(@search_term)
        end
    end

    def show
        @project = current_user.projects.find(params[:id])
    end

    def edit
        @project =current_user.projects.find(params[:id])
    end

    def update
        @project = current_user.projects.new(project_params.merge(user_id: @user.id))
        if @project.update(project_params)
            redirect_to user_projects_path(@user,@project)
        else
            render 'edit'
        end
    end

    def destroy
        @project = current_user.projects.find(params[:id])
        @project.destroy
        redirect_to  user_projects_path
    end

    private
   
    def get_user 
        @user = User.find(params[:user_id])
    end

    def project_params
        params.require(:project).permit(:project_name, :duration, :team_size, :lead_name, :start_date,:employee_name)
    end
end
