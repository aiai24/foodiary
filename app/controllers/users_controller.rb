class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
        foods = @user.foods.pluck(:name)
        recipes = Recipe.all
        @teian = {}
        recipes.each do |r|
            if (r.materials.split(",") & foods).length != 0
                @teian[r.name] = (r.materials.split(",") & foods).length
            end
        end
        @foods = @user.foods.order("limit_date")
        @num = @foods.size
        @array = Array.new(@num, true)
        @today = Date.today
    end
end
