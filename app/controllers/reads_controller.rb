class ReadsController < ApplicationController
    def index
        @foodstuffs = Foodstuff.all
        @recipe = Recipe.all
    end
    def create
        foodstuff = Foodstuff.all
        foodstuff.destroy_all

        xlsx = Roo::Excelx.new('app/assets/excel/food.xlsx')
        sheet = xlsx.sheet('食材名')

        i = 0
        loop do
            i = i + 1
            @foodstuff = Foodstuff.new
            @foodstuff.name = sheet.cell(i,1)
            unless @foodstuff.name.present?
                break
            end
            @foodstuff.save
        end
        redirect_to reads_path
    end
    def create_recipe
        recipe = Recipe.all
        recipe.destroy_all

        xlsx = Roo::Excelx.new('app/assets/excel/food.xlsx')
        sheet = xlsx.sheet('料理レシピ')

        i = 1
        loop do
            i = i + 1
            @recipe = Recipe.new
            @recipe.name = sheet.cell(i,1)
            @recipe.materials = [sheet.cell(i,2),sheet.cell(i,3),sheet.cell(i,4),sheet.cell(i,5),sheet.cell(i,6),sheet.cell(i,7),sheet.cell(i,8),sheet.cell(i,9),sheet.cell(i,10),sheet.cell(i,11)].join(",")
            unless @recipe.name.present?
                break
            end
            @recipe.save
        end
        redirect_to reads_path
    end
    def foodstuff_params
        params.require(:foodstuff).permit(:name)
    end
    def recipe_params
        params.require(:recipe).permit(:name,:materials)
    end
end
