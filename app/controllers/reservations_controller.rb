class ReservationsController < ApplicationController
  before_filter :load_parent
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.restaurant_id = @restaurant.id
    if @reservation.save
      redirect_to restaurant_path(@restaurant), notice: "Your reservation was created successfully"

    else
      render 'new'
    end
  end


  def show
    @reservation = Reservation.find(params[:id])

  end

  def edit
    @reservation = Reservation.find(params[:id])

  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
     redirect_to reservation_path(@reservation)
   else
     render 'edit'
   end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to restaurants_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:time, :party_size)
  end

  def load_parent

    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
