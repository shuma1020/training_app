class PatronMailer < ApplicationMailer

  def notification_for_patron(patron)
    @patron = patron
    @user = @patron.user
    if mail(subject: "パトロンになったことを確認いたしました。",to: @user.email)
      @notification = @patron.notifications.new(user_id: @user.id)
      @notification.product_id = @product.id
      @notification.save
    end
  end

  def notification_for_owner(patron)
    @patron = patron
    @user = @patron.user
    @product = @patron.product
    if mail(subject: "#{@user.email}さんが#{@product.title}のパトロンになったことを確認いたしました。",to: @product.user.email)
      @notification = @patron.notifications.new(user_id: @user.id)
      @notification.product_id = @product.id
      @notification.save
    end
  end
end
