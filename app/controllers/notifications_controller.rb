class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
    @notifications.each do |notification|
      @patron = Patron.find_by(id: notification.patron_id)
      if @patron
        @product  = @patron.product
      end
    end

  end
end
