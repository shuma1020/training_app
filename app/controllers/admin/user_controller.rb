class Admin::UserController < ApplicationController
    def new
        @products = Product.all
    end

    def index
        @products = Product.all
    end

    def create
　　　　
    end

    def destroy
      p  @product.destroy
        
        
    end

end
