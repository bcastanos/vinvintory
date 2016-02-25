class BottlesController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  # helper_method :sort_column, :sort_direction

  # def index
  #   @bottles = Bottle.order("#{sort_column} #{sort_direction}")
  # end
  #
  def new
    @bottle = current_user.bottles.build if logged_in?
  end
  #
  # def show
  #   @bottle = Bottle.find(params[:id])
  # end

  def create
    @bottle = current_user.bottles.build(bottles_params)
    if @bottle.save
      flash[:success] = "Added to your cellar."
      redirect_to root_url
    else
      redirect_to user_path
    end
  end

  # def edit
  #   @bottle = Bottle.find(params[:id])
  # end
  #
  # def update
  #   @bottle = Bottle.find(params[:id])
  #   if Bottle.update_attributes(params.require(:bottle).permit(:qty, :vintage, :wine, :price))
  #     redirect_to users_path
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @bottle = Bottle.find(params[:id])
    @bottle.destroy
    redirect_to user_path(@user)
  end

  private

  def bottles_params
    params.require(:bottle).permit(:qty, :vintage, :wine, :price)
  end

  # def sortable_columns
  #   ["qty", "vintage", "wine", "price"]
  # end

  # def sort_column
  #   sortable_columns.include?(params[:column]) ? params[:column] : "wine"
  # end
  #
  # def sort_direction
  #   %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  # end

end
