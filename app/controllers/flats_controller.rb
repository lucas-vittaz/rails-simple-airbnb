class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to @flat
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])

    if @flat.update(flat_params)
      redirect_to @flat
    else
      render :edit
    end
  end

  private

  def flat_params
    params.require(:flat).permit( :name, :address, :description, :price_per_night, :number_of_guest )
  end
end
