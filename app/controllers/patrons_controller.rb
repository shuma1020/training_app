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
    @reward = @rewards.order(price: :desc).first
    @patron.reward_id = @reward.id
    respond_to do |format|
      if @patron.save
        format.html { redirect_to @product, notice: 'パトロンになりました' }
        format.json { render :show, status: :created, location: @product }
      else
        p "####l"
        format.html { render :new }
        format.json { render json: @patron.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def patron_params
      params.require(:patron).permit(:donation, :user_id, :product_id, :reward_id)
    end
end
