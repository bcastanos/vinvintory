class BottlesController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    @bottles = Bottle.order("#{sort_column} #{sort_direction}")
  end

  def new
    @bottle = Bottle.new
  end

  def show
    @bottle = Bottle.find(params[:id])
  end

  def create
    @bottle = Bottle.new(params.require(:bottle).permit(:qty, :vintage, :wine, :price))
    if @bottle.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @bottle = Bottle.find(params[:id])
  end

  def update
    @bottle = Bottle.find(params[:id])
    if Bottle.update_attributes(params.require(:bottle).permit(:qty, :vintage, :wine, :price))
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @bottle = Bottle.find(params[:id])
    @bottle.destroy
    redirect_to user_path(@user)
  end

  private

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
