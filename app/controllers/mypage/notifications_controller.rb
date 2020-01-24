class Mypage::NotificationsController < ApplicationController

  def index
    read = current_user.notifications.where(status:"unread").update(status:"read")
    unread = @notifications.where(status:"unread")
    @count_unread = unread.count
  end
end
