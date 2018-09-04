class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    stream_for "notifications_for_#{params[:current_user_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
