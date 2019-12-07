class AdminController < ApplicationController
    layout "admin"
  
    protected

    def not_authenticated
      redirect_to "/admin/login"
    end
end
