class Admin::UserSessionsController < AdminController
    skip_before_action :require_login, except: [:destroy], raise: false

    def new
       
    end

    def index
        @products = Product.all
    end

    def create
　　　　
    end

    def destroy
　　　　
    end
end
