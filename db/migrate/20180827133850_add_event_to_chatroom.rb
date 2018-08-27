class AddEventToChatroom < ActiveRecord::Migration[5.2]
  def change
    add_reference :chatrooms, :event, foreign_key: true
  end
end
