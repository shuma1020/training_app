class PatronsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @patron = @product.patrons.new
    @rewards = @product.rewards
  end

  def create
    product = Product.find(params[:product_id])
    if Patron.create_with_donation(product, current_user, patron_params)
      format.html { redirect_to product, notice: 'パトロンになりました' }
      format.json { render :show, status: :created, location: @product }
    else
      rewards = product.rewards
      format.html { render :new }
      format.json { render json: patron.errors, status: :unprocessable_entity }
    end
  end

  private
    def patron_params
      params.require(:patron).permit(:donation, :user_id, :product_id, :reward_id)
    end
end
