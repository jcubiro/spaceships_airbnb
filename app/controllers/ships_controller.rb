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
    ship = current_user.ships.build(ship_params)
    if ship.save
      redirect_to root_path, notice: 'Ship was successfully created.'
    else
      render :new, alert: ship.errors.full_messages.to_sentence
    end
  end

  def show; end

  private

  def find_ship
    @ship = Ship.find(params[:id])
  end
end
