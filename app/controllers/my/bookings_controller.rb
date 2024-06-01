module My
  class BookingsController < ApplicationController

    def show
      ## shows details of specific booking
    end

    def index
      @bookings = current_user.bookings
    end
  end
end
