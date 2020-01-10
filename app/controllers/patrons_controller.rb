class PatronsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @patron = Patron.new
    @rewards = @product.rewards
  end

  def create
    @product = Product.find(params[:product_id])
    @rewards = @product.rewards
    @patron = @product.patrons.new(patron_params)
    @patron.user_id = current_user.id
    respond_to do |format|
      if @patron.donation >= @rewards.maximum(:price)
      if @reward.patron.save
        format.html { redirect_to @product, notice: 'パトロンになりました' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @patron.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def patron_params
      params.require(:patron).permit(:donation, :user_id, :product_id)
    end

end
