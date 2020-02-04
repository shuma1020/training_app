class PatronsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @patron = @product.patrons.new
    @rewards = @product.rewards
  end

  def create
    @product = Product.find(params[:product_id])
    @patron = @product.patrons.new(patron_params)
    @patron.user_id = current_user.id
    @rewards = Reward.where("price<?",@patron.donation)
    reward = @rewards.order(price: :desc).first
    if reward
      @patron.reward_id = reward.id
    else
      @patron.reward_id == nil
    end
    respond_to do |format|
      if @patron.save
        @notification = @patron.notifications.new(user_id: @patron.product.user.id)
        @notification.save
        @notification = @patron.notifications.new(user_id: current_user.id)
        if @notification.save
          PatronMailer.notification_for_patron(@patron).deliver_now
          PatronMailer.notification_for_owner(@patron).deliver_now
        end
        format.html { redirect_to @product, notice: 'パトロンになりました' }
        format.json { render :show, status: :created, location: @product }
      else
        @rewards = @product.rewards
        format.html { render :new }
      end
    end
  end

  private
    def patron_params
      params.require(:patron).permit(:donation, :user_id, :product_id, :reward_id)
    end
end
