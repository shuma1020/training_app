class PatronsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
  end
end
