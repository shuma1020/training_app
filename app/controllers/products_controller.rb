class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :like]
  before_action :login_check, only: [:new, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :destroy]


  # GET /products
  # GET /products.json
  def index

    if params[:title].nil?

    end

    @products = Product.all
    @products = @products.where(title: params[:title]) if params[:title].present?
    @products = @products.where(status: params[:status]) if params[:status].present?
    @products = @products.where("price>=? AND price<=?", "#{params[:price_gteq]}", "#{params[:price_lt]}") if params[:price_gteq].present? && params[:price_lt].present?
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @patrons = @product.patrons.all
    @rewards = @product.rewards
    @patron = current_user.patrons.find_by(product: @product)
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
      unless user_signed_in? && @product.owner?(current_user)
        flash[:alert] = "編集権限がありません"
        redirect_to root_path
      end
    end
end
