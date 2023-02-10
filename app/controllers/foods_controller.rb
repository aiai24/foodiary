class FoodsController < ApplicationController
    before_action :authenticate_user!
    def index
        
        @today = Date.today
        if params[:search] == nil 
            @foods = current_user.foods.order("limit_date")
        elsif params[:search] == ''
            @foods = current_user.foods.order("limit_date")
        else
            @foods = current_user.foods.where("name LIKE ? ",'%' + params[:search] + '%').order("limit_date")
        end
        @num = @foods.size
        @array = Array.new(@num, true)
    end
    def new
        @food = Food.new
        @foods = Foodstuff.pluck(:name).join(",")
    end
    def create
        food = Food.new(food_params)
        food.user_id = current_user.id
        if food.save
          redirect_to user_path(current_user.id)
        else
          redirect_to :action => "new"
        end
    end
    def edit
        @food = Food.find(params[:id])
    end
    def update
        food = Food.find(params[:id])
        if food.update(food_params)
            redirect_to user_path(current_user.id)
        else
            redirect_to :action => "edit", :id => params[:id]
        end
    end
    def destroy
        food = Food.find(params[:id])
        food.destroy
        redirect_to user_path(current_user.id)
    end
      private
      def food_params
        params.require(:food).permit(:name,:num,:limit_date,:deadtime,:price,:where)
      end
end
