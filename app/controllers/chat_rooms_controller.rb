class ChatRoomsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  def index
    @chat_rooms = ChatRoom.all.order(updated_at: :desc)
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room created'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def edit
    @chat_room = current_user.chat_rooms.find_by(id: params[:id])
  end

  def update
    @chat_room = current_user.chat_rooms.find_by(id: params[:id])
    @chat_room.update(chat_room_params)
    if @chat_room.update(chat_room_params)
      flash[:success] = 'Chat room updated'
      redirect_to @chat_room
    else
      render 'edit'
    end
  end

  def destroy
    @chat_room = current_user.chat_rooms.find_by(id: params[:id])
    @chat_room.destroy
    if @chat_room.save
      flash[:success] = 'Chat room deleted'
    end
    redirect_to chat_rooms_path
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title, :description, :ephemeral)
  end
end
