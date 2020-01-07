class Mypage::PatronsController < ApplicationController

  def index
    @patrons = current_user.patrons
  end

end
