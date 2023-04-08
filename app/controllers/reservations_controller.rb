class ReservationsController < ApplicationController
  def index
    binding.pry
    @reservations = current_user.reservations.includes(:room)
  end

  def new

  end

  def create
    @reservation = current_user.reservations.build(params.require(:reservation).permit(:check_in, :check_out, :people, :room_id, :user_id ))
    if @reservation.save
      flash[:notice] = "予約が完了しました。"
      redirect_to :reservations
    else
      @room = Room.find_by(params[:reservation][:room_id])
      render "rooms/show"
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
