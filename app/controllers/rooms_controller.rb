class RoomsController < ApplicationController
  before_action :load_entities, only: [:show, :edit, :update]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(permitted_parameters)

    if @room.save
      flash[:success] = "Ruangan #{@room.name} berhasil dibuat"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(permitted_parameters)
      flash[:success] = "Ruangan berhasil diperbarui"
      redirect_to rooms_path
    else
      render :edit
    end
  end

  def show
    @rooms = Room.all
    @room_message = RoomMessage.new(room: @room)
    @room_messages = @room.room_messages.includes(:user)
  end


  private

  def load_entities
    @room = Room.find(params[:id])
  end

  def permitted_parameters
    params.require(:room).permit(:name)
  end
end
