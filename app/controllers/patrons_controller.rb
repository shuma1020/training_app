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
        if @patron.donation >= @rewards.maximum(:price)
          @reward = @rewards.find_by(price: @rewards.maximum(:price))
          @patron.reward_id= @reward.id
          if @patron.save
            format.html { redirect_to @product, notice: 'パトロンになりました' }
            format.json { render :show, status: :created, location: @product }
          else
            format.html { render :new }
            format.json { render json: @patron.errors, status: :unprocessable_entity }
          end
        elsif @rewards.median(:price) <= @patron.donation && @patron.donation < @rewards.maximum(:price)
          @reward = @rewards.find_by(price: @rewards.median(:price))
          @patron.reward_id= @reward.id
          if @patron.save
            format.html { redirect_to @product, notice: 'パトロンになりました' }
            format.json { render :show, status: :created, location: @product }
          else
            format.html { render :new }
            format.json { render json: @patron.errors, status: :unprocessable_entity }
          end
        elsif  @patron.donation < @rewards.median(:price) && @patron.donation > @rewards.minimum(:price)
          @reward = @rewards.find_by(price: @rewards.minimum(:price))
          @patron.reward_id= @reward.id
          if @patron.save
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
        if @patron.donation >= @rewards.maximum(:price)
          @reward = @rewards.find_by(price: @rewards.maximum(:price))
          @patron.reward_id= @reward.id
          if @patron.save
            format.html { redirect_to @product, notice: 'パトロンになりました' }
            format.json { render :show, status: :created, location: @product }
          else
            format.html { render :new }
            format.json { render json: @patron.errors, status: :unprocessable_entity }
          end
        elsif  @patron.donation < @rewards.median(:price) && @patron.donation > @rewards.minimum(:price)
          @reward = @rewards.find_by(price: @rewards.minimum(:price))
          @patron.reward_id= @reward.id
          if @patron.save
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
      else
        if @patron.donation >= @rewards.maximum(:price)
          @reward = @rewards.find_by(price: @rewards.maximum(:price))
          @patron.reward_id= @reward.id
          if @patron.save
            format.html { redirect_to @product, notice: 'パトロンになりました' }
            format.json { render :show, status: :created, location: @product }
          else
            format.html { render :new }
            format.json { render json: @patron.errors, status: :unprocessable_entity }
          end
        else
          format.html { render :new }
        end
      end
    end
  end

  private
    def patron_params
      params.require(:patron).permit(:donation, :user_id, :product_id, :reward_id)
    end

end
