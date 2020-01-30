class PatronsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @patron = @product.patrons.new
    @rewards = @product.rewards
  end

  def create
    @product = Product.find(params[:product_id])
    @patron = Patron.create_with_donation(@product, current_user, patron_params)
    respond_to do |format|
      if @patron.valid?
        format.html { redirect_to @product, notice: 'パトロンになりました' }
        format.json { render :show, status: :created, location: @product }
      else
        @rewards = @product.rewards
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
