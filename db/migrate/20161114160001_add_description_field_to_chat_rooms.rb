class AddDescriptionFieldToChatRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :description, :string, limit: 200
  end
end
