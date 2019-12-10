class Admin::ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :admin_check
    def new
        @product = Product.all
    end
    def index
        @products = Product.all
    end

    def create
　　　　
    end

    def destroy
        @product.destroy
    end
    def edit
        @product = Product.all
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def admin_check
        unless user_signed_in? && current_user.role == :staff
            redirect_to root_path
            flash[:notice] = "管理者画面です"
        end
    end
end
