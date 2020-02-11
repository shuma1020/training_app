class Mypage::ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    def index
        @products = current_user.products.page(params[:page]).per(5)
    end

    def new
        @product = current_user.products.new
        @product.rewards.build
    end

    def edit
    end

    def show
        if params[:id]
            @product = Product.find(params[:id])
            @rewards = @product.rewards
        else
            @rewards = Reward.all
        end
    end

    def created
        @product = current_user.products.new(product_params)
        respond_to do |format|
            if @product.save
            format.html { redirect_to @product, notice: 'Product was successfully created.' }
            format.json { render :show, status: :created, location: @product }
            else
            format.html { render :new }
            format.json { render json: @product.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
        if @product.update(product_params)
            format.html { redirect_to mypage_product_path(@product), notice: 'Product was successfully updated.' }
            format.json { render :show, status: :ok, location: @product }
        else
            format.html { render :edit }
            format.json { render json: @product.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @product.destroy
        respond_to do |format|
            format.html { redirect_to mypage_products_path, notice: 'Product was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    def liked
        @products = current_user.liked_products.all
    end

    def unlike
        current_user.liked_products.destroy(Product.find(params[:id]))
        redirect_to :liked_mypage_products, notice: "いいねを削除しました！"
    end


    private
    def product_params
        params.require(:product).permit(:title, :price, :description, :message, :status, :user_id, :image, :image_cache, :remove_image, rewards_attributes: [:title, :description, :price, :product_id, :user_id])
    end

    def set_product
        @product = current_user.products.find(params[:id])
    end
end
