class BottlesController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
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
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @bottle = Bottle.find(params[:id])
  end
  #
  def update
    @bottle = Bottle.find(params[:id])
    if @bottle.update(bottles_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @bottle.destroy
    flash[:success] = "Entry deleted"
    redirect_to user_path(current_user)
  end

  private

  def bottles_params
    params.require(:bottle).permit(:qty, :vintage, :wine, :price, :id)
  end

  def correct_user
      @bottle = current_user.bottles.find_by(id: params[:id])
      redirect_to user_path(current_user) if @bottle.nil?
      flash[:danger] = "Not your bottle!"
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
