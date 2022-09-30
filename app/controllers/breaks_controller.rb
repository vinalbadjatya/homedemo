class BreaksController < ApplicationController

    load_and_authorize_resource

    before_action :get_user 

    def new
      @bk= Break.new
    end
  
    def create
      @bk = Break.new(break_params.merge(user_id: @user.id)) 
      if @bk.save!
        redirect_to user_break_path(@user, @bk)
      else
        render 'new'
      end
    end
  
    def index
        @bks = Break.all
        if params[:search]
            @search_term = params[:search]
            @bks = @bks.search_by(@search_term)
        end
    end
  
    def edit 
        @bk = Break.find(params[:id])
    end
  
    def update
        @bk = Break.new(break_params.merge(user_id: @user.id))
        if @break.update(break_params)
            redirect_to user_breaks_path(@user,@bk)
        else
            render 'edit'
        end
    end
  
  
    def show
        @bk = Break.find(params[:id])

    end
  
    def destroy
        @bk =  Break.find(params[:id])
        @bk.destroy
        redirect_to user_breaks_path
    end
      
    private
     
    def get_user 
      @user = User.find(params[:user_id])
    end

    def break_params
        params.require(:break).permit(:f_date, :t_date,:day, :reason, :to, :user_id)
    end
end
