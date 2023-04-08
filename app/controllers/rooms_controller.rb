class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:hotel_name, :introduction, :hotel_price, :address, :hotel_image))
    if @room.save
      flash[:notice] = "施設情報が更新されました"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @reservations = @room.reservations
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:hotel_name, :introduction, :hotel_price, :address, :hotel_image))
      flash[:notice] = "編集が完了しました"
      redirect_to :rooms
    else
      render :edit
    end
  end

  def destroy
    @room = room.find(params[:id])
    @room.destroy
    flash[:notice] = "削除しました"
    redirect_to :rooms
  end

end