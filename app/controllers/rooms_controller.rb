class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms
  end

  def new
    @user = current_user
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:hotel_name, :introduction, :hotel_price, :address, :hotel_image, :user_id))
    if @room.save
      flash[:notice] = "施設情報が更新されました"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new(room_id: @room.id)
    @reservations = @room.reservations.build
    @reservation.check_in = Date.today
    @reservation.check_out = Date.tomorrow
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