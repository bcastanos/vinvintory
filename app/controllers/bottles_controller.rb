class BottlesController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: [:edit, :destroy]
  helper_method :sort_column, :sort_direction

  def new
    @bottle = current_user.bottles.build if logged_in?
  end

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

  def update
    @bottle = Bottle.find(params[:id])
    if @bottle.update(bottles_params)
      redirect_to user_path(current_user)
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
      params.require(:bottle).permit(:qty, :vintage, :wine, :price, :id, :avatar, :name)
    end

    def correct_user
      @bottle = current_user.bottles.find_by(id: params[:id])
      redirect_to user_path(current_user) if @bottle.nil?
      flash[:danger] = "Not your wine!" if @bottle.nil?
    end

    #Column Sorting

    def sortable_columns
      ["qty", "vintage", "wine", "price"]
    end

    def sort_column
      sortable_columns.include?(params[:column]) ? params[:column] : "wine"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end
