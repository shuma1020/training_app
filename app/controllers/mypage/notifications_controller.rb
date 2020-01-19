class Mypage::NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications
    @products = Product.where(user_id: current_user.id)
    @products.each do |product|
      @receive_notifications = product.notifications
    end
  end
end
