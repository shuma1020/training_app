class Mypage::NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
    p @notifications
  end
end
