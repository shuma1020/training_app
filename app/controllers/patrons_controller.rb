class PatronsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    p @rewards = @product.rewards
  end
end
