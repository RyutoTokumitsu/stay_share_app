class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.includes(:room)
    @reservation = Reservation.new
  end

  def new

  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(@reservation.room_id)
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      flash[:notice] = "予約が完了しました。"
      redirect_to :reservations
    else
      flash[:alert] = @reservation.errors.full_messages
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
    @reservation = Reservation.find(params[:id])
    if @reservation.update(params.require(:reservation).permit(:check_in, :check_out, :people))
      flash[:notice] = "編集が完了しました"
      redirect_to :reservations
    else
      render :edit
    end
  end

  def destroy
  end

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :people, :room_id, :user_id)
  end
end
