class AgentsController < ApplicationController

    def create
      @product = Product.find(params[:product_id])
        @agent = Agent.new(
            product_id: params[:product_id],
            user_id: current_user.id
        )

        if @agent.save
            redirect_to product_path(@product), notice: "パトロンになりました！"
        else
            redirect_to product_path(@product), notice: "すでにパトロンになっています"
        end
    end
end
