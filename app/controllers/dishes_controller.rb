class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  def index
    @dishes = Dish.all 
  end 

  def new
    @dish = Dish.new 
  end 

  def create
    @dish = Dish.new(dish_params)
      binding.pry
    if @dish.save
      flash[:success] = "Your dish has been added!"
      redirect_to dishes_path
    else 
      flash.now[:alert] = "Your new post couldn't be created!  Please check the form."
      render :new
    end
  end 

  def show

  end 

  def edit  

  end

  def update  
    if @dish.update_attributes(dish_params)
      flash[:success] = "Dish updated!"
      redirect_to(dish_path(@dish))
    else 
      flash.now[:alert] = "Update failed!"
      render :edit
    end 
  end 

  def destroy
    @dish.destroy
    redirect_to dishes_path
  end 

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end 

  def dish_params  
    params.require(:dish).permit(:image, :description, :name, :price, :taste, :restaurant, :full_meal, :location, :special, :vegetarian, :consistent)
  end 
end
