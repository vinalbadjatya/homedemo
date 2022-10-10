class HolidaysController < ApplicationController
load_and_authorize_resource
def index
  @holidays = Holiday.all
  respond_to do |format|
    format.html 
    format.js
  end
end

def new
  @holiday = Holiday.new
  respond_to do |format|
    format.html 
    format.js
  end
end

def show 
  @holiday = Holiday.find(params[:id])
  respond_to do |format|
    format.html 
    format.js
  end
end

def edit 
  @holiday = Holiday.find(params[:id])
  respond_to do |format|
    format.html 
    format.js
  end
end

def create
  @holiday = Holiday.new(holiday_params)
  respond_to do |format|
    if @holiday.save
      format.html { redirect_to @holiday }
      format.js
      # redirect_to @holiday
    else
      render 'new'
      # render 'new'
    end
  end
end

def update
  @holiday = Holiday.find(params[:id])
    respond_to do |format|
      if @holiday.update(holiday_params)
        format.html { redirect_to @holiday }
        format.js
        # redirect_to @holiday
      else  
        render 'new' 
      end
    end
end

def destroy
  @holiday = Holiday.find(params[:id]) 
  @holiday.destroy
  respond_to do |format|
    format.html { redirect_to @holiday }
    format.js
  end
end

private
    
def holiday_params
  params.require(:holiday).permit(:ocassion,:day,:on_date)
end
end
