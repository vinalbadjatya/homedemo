class HolidaysController < ApplicationController
    def new
        @holiday = Holiday.new
    end


    def index
        @holidays = Holiday.all
    end

    def show 
        @holiday = Holiday.find(params[:id])
    end

    def create
        @holiday = Holiday.new(holiday_params)
        if @holiday.save
            redirect_to @holiday
        else
            render 'new'
        end
    end

    def update
        @holiday = Holiday.find(params[:id])
            if @holiday.update(holiday_params)
              redirect_to @holiday
            else
              render 'edit'
            end
      end

    def destroy
        @holiday = Holiday.find(params[:id]) 
        @holiday.destroy
        redirect_to @holiday
    end

    private
    def holiday_params
        params.require(:holiday).permit(:ocassion,:day,:on_date)
    end
end
