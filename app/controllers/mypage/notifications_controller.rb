class Mypage::NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
    unread = @notifications. unread?
    unread.update.read?
    @count_unread = unread.count
  end
end
