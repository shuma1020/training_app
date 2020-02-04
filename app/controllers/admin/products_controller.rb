class Admin::ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :admin_check
    def new
        @product = Product.all
    end
    def index
        @q = Product.ransack(params[:q])
        @products = @q.result(distinct: true)
    end

    def create
　　　　
    end

    def destroy
        @product.destroy
    end
    def edit

    end

    def search_params
        params.require(:q).permit(:title_cont, :status_cont, :price)
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
        @product = Product.find(params[:id])
    end

    def admin_check
        unless user_signed_in? && current_user.role == "staff"
            redirect_to root_path
            flash[:notice] = "管理者画面です"
        end
    end
end
