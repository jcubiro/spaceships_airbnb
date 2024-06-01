module My
  class ShipsController < ApplicationController
    before_action :authenticate_user!

    def index
      @ships = current_user.ships.all
    end

    def new
      @ship = current_user.ships.build
    end

    def create
      @ship = current_user.ships.build(ship_params)
      if @ship.save
        redirect_to my_ships_path, notice: 'Ship was successfully created.'
      else
        flash[:alert] = 'Invalid ship'
        render :new
      end
    end

    private

    def ship_params
      params.require(:ship).permit(:name, :description, :capacity, :price_per_day, :location, :available_from, :available_to)
    end
  end
end
