class Mypage::NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
    unread = @notifications.unread
    @notifications.each do |notification|
      notification.read!
    end
    @count_unread = unread.count
  end
end
