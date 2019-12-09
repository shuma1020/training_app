class Admin::ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
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

    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
end
