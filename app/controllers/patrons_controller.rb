class PatronsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @patron = Patron.new
    @rewards = @product.rewards
  end

  def create
    @product = Product.find(params[:product_id])
    @patron = @product.patrons.new(patron_params)
    @patron.user_id = current_user.id
    @rewards = @product.rewards
    respond_to do |format|
      if @rewards.size >= 3
        @reward = @rewards.find_by(price: @rewards.maximum(:price))
        @patron.reward_id = @reward.id
        if @patron.save
          if @patron.donation >= @rewards.maximum(:price)
            format.html { redirect_to @product, notice: 'パトロンになりました' }
            format.json { render :show, status: :created, location: @product }
          elsif @rewards.median(:price) <= @patron.donation && @patron.donation < @rewards.maximum(:price)
            @reward = @rewards.find_by(price: @rewards.median(:price))
            format.html { redirect_to @product, notice: 'パトロンになりました' }
            format.json { render :show, status: :created, location: @product }
          elsif  @patron.donation < @rewards.median(:price) && @patron.donation > @rewards.minimum(:price)
            @reward = @rewards.find_by(price: @rewards.minimum(:price))
            format.html { redirect_to @product, notice: 'パトロンになりました' }
            format.json { render :show, status: :created, location: @product }
          else
            format.html { render :new }
            format.json { render json: @patron.errors, status: :unprocessable_entity }
          end
        else
          format.html { render :new }
          format.json { render json: @patron.errors, status: :unprocessable_entity }
        end
      elsif 2 == @rewards.size
          if @patron.donation != nil && @patron.donation >= @rewards.maximum(:price)
            @reward = @rewards.find_by(price: @rewards.maximum(:price))
            @patron.reward_id = @reward.id
            if @patron.save
              format.html { redirect_to @product, notice: 'パトロンになりました' }
              format.json { render :show, status: :created, location: @product }
            else
              format.html { render :new }
              format.json { render json: @patron.errors, status: :unprocessable_entity }
            end
          elsif @patron.donation != nil && @rewards.minimum(:price) <= @patron.donation && @patron.donation < @rewards.maximum(:price)
            @reward = @rewards.find_by(price: @rewards.minimum(:price))
            @patron.reward_id = @reward.id
            if @patron.save
              format.html { redirect_to @product, notice: 'パトロンになりました' }
              format.json { render :show, status: :created, location: @product }
            else
              format.html { render :new }
              format.json { render json: @patron.errors, status: :unprocessable_entity }
            end
          else
            flash[:alert] = "最低金額に達していません"
            format.html { render :new }
          end

      else
        @reward = @rewards.find_by(price: @rewards.minimum(:price))
        @patron.reward_id = @reward.id
        if @patron.save
          format.html { render :new }
          format.json { render json: @patron.errors, status: :unprocessable_entity }
        else
          format.html { render :new }
          format.json { render json: @patron.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    def patron_params
      params.require(:patron).permit(:donation, :user_id, :product_id, :reward_id)
    end
end
