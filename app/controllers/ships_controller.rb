class ShipsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_ship, only: :show

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

  def show; end

  private

  def ship_params
    params.require(:ship).permit(:name, :description, :price_per_day, :available_from, :available_to)
  end

  def find_ship
    @ship = Ship.find(params[:id])
  end

  def set_airports
    @airports = Ship::AIRPORTS
  end
end
