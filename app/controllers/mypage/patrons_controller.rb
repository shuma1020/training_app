class Mypage::PatronsController < ApplicationController

  def index
    p "44"
    p @patrons = current_user.patrons
  end

end
