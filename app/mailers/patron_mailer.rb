class PatronMailer < ApplicationMailer

  def notification_for_patron(patron)
    user = patron.user
    notifications = user.notifications
    @product = patron.product
    mail(subject: "パトロンになったことを確認いたしました。",to: user.email)
  end

  def notification_for_owner(patron)
    @user = patron.user
    notification = @user.notifications
    @product = patron.product
    mail(subject: "#{@user.email}さんが#{@product.title}のパトロンになったことを確認いたしました。",to: @product.user.email)
  end
end
