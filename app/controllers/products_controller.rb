class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :like]
  before_action :login_check, only: [:new, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :destroy]


  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  def draft
    @products = Product.draft
  end

  def release
    @products = Product.release
  end

  def like
    @product = Product.find(params[:id])
    current_user.liked_products << @product
    redirect_to @product, notice: "いいねしました！"
  end

  def patron
    @product = Product.find(params[:id])
    current_user.donation = (params[:donation])
    respond_to do |format|
      if current_user.save
      format.html { redirect_to @product, notice: 'Product was successfully created.' }
      format.json { render :show, status: :created, location: @product }
      else
      format.html { render :new }
      format.json { render json: @product.errors, status: :unprocessable_entity }
      end
  end
  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :price, :description, :message, :status, :user_id, :image, :image_cache, :remove_image)
    end

    def login_check
      unless user_signed_in?
        flash[:alert] = "ログインしてください"
        redirect_to root_path
      end
    end

    def user_check
      unless user_signed_in? && @product.user_id == current_user.id
        flash[:alert] = "編集権限がありません"
        redirect_to root_path
      end
    end
end
