class PatronsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @patrons =Patron.new
  end

  def create
    @product = Product.find(params[:product_id])
    @patron =@product.patrons.new(patron_params)
    p @patron.user_id = current_user.id
    p "##999999"
    respond_to do |format|
      if p @patron.save
        format.html { redirect_to @product, notice: 'パトロンになりました' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def patron_params
      params.require(:patron).permit(:donation, :user_id, :product_id)
    end

end
