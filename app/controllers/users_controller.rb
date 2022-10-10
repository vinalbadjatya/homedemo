class UsersController < ApplicationController

  # before_action :authenticate_user!,only: [:show]
  def new
    @user = User.new
  end

  def index
    @users = User.all
    if params[:search]
    @search_term = params[:search]
    @users = @users.search_by(@search_term)
    end
  end

  def edit
   @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create(user_params)
    if @user.save
        redirect_to @user
    else
        render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def delete 
    @user = User.find(params[:id])
    @user.destroy
    redirect_to  user_breaks
  end

  private

  def user_params
    params.require(:user).permit(:email,:role,:user_name,:user_mobileno,:date_of_birth,:skills, :role_id)
  end
  
end
