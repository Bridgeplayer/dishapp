class DishesController < ApplicationController
	def index
		@dishes = Dish.all
		@dish = Dish.new
	end

	def new
		@dish = Dish.new
	end

	def create
		# dish_params = params[:dish].permit(:name, :description)
		@dish = Dish.new(dish_params)
		if @dish.save
			flash[:success] = "Dish created"
			redirect_to dishes_path
		else
			flash.now[:failure] = "Dish not created"
			render "dishes/new"
		end
	end

	def edit
		@dish = Dish.find(params[:id])
	end

	def update
		@dish = Dish.find(params[:id])
		if @dish.update(dish_params)
			flash[:success] = "Dish updated"
			redirect_to dishes_path
		else
			flash.now[:failure] = "Dish not updated"
			render "dishes/edit"
		end			
	end

	def destroy
		@dish = Dish.find(params[:id])
		if @dish.destroy
			flash[:success] = "Dish destroyed"
			redirect_to dishes_path
		end
	end


	private 
	def dish_params
		params.require(:dish).permit(:name, :description)
	end
end