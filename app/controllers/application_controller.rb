class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :notification

  def notification
    @notifications = current_user.notifications
    @unread = @notifications.where(status:"unread")
    @count_unread = @unread.count
  end
end
