class Mypage::NotificationsController < ApplicationController

  def index

    if @products = Product.where(user_id: current_user.id)
      @products.each do |product|
        @notifications = product.notifications
      end
    else
      @notifications = current_user.notifications
    end


  end
end
