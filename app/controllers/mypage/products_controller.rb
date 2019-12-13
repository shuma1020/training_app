class Mypage::ProductsController < ApplicationController

    def index
        @products = current_user.products.all
    end
end
