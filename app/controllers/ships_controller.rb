class ShipsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @ships = Ship.all
  end

  def new
    @ship = current_user.ships.build
  end

  def create
    @ship = current_user.ships.build(ship_params)
    if @ship.save
      redirect_to ships_path, notice: 'Ship was successfully created.'
    else
      render :new
    end
  end

  private

  def ship_params
    params.require(:ship).permit(:name, :description, :price_per_day, :available_from, :available_to)
  end
end
