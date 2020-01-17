class PatronMailer < ApplicationMailer

  def notification_for_patron(patron)
    @patron = patron
    @user = @patron.user
    mail(subject: "パトロンになったことを確認いたしました。",to: @user.email)
  end

  def notification_for_owner(patron)
    @patron = patron
    @user = @patron.user
    @product = @patron.product
    @notification = @patron.notifications.new(user_id: @user.id)
    @notification.save
    if mail(subject: "#{@user.email}さんが#{@product.title}のパトロンになったことを確認いたしました。",to: @product.user.email)

    else
      puts "確認用のメールは送信できませんでした。"
    end
  end
end
