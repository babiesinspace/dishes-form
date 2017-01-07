class DishesController < ApplicationController

  def index
    @dishes = Dish.all 
  end 

  def new
    @dish = Dish.new 
  end 

  def create
    dish = Dish.create(dish_params)
    redirect_to dishes_path
  end 

  private

  def dish_params  
    params.require(:dish).permit(:image, :description)
  end 
end
