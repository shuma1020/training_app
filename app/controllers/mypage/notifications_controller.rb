class Mypage::NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
    @unread = @notifications.where(status:"unread")
    @unread.update(status:"read")
  end
end
