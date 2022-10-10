class ProjectsController < ApplicationController

  load_and_authorize_resource
  skip_before_action :verify_authenticity_token
  before_action :get_user

  def new
    @project = Project.new
    respond_to do |format|
      format.html 
      format.js
    end
  end

  def create
    @project = Project.new(project_params.merge(user_id: @user.id))
    respond_to do |format|
    #byebug
      if @project.save!
       format.html {redirect_to user_project_path(@user,@project)}
       format.js
      else
      render 'new'
      end
    end
  end

  def index
    @projects = Project.all
    respond_to do |format|
      format.html 
      format.js
    end
    if params[:search]
      @search_term = params[:search]
      @projects = @projects.search_by(@search_term)
    end
  end

  def show
    @project = Project.find(params[:id])
    respond_to do |format|
      format.html 
      format.js
    end
  end

  def edit
    @project = Project.find(params[:id])
    respond_to do |format|
      format.html 
      format.js
    end
  end

  def update
    @project = Project.new(project_params.merge(user_id: @user.id))
    respond_to do |format|
      if @project.update(project_params)
        format.html {redirect_to user_projects_path(@user,@project)}
        format.js
      else
        render 'edit'
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to  user_projects_path }
      format.js
    end
  end

  private
   
  def get_user 
     @user = User.find(params[:user_id])
  end

  def project_params
    params.require(:project).permit(:project_name, :duration, :team_size, :lead_name, :start_date,:employee_name,:user_id)
  end
end
