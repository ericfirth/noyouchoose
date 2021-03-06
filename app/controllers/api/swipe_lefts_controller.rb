class Api::SwipeLeftsController < ApplicationController

  def show
  end

  def create
    restaurant = PotentialRestaurant
      .where('restaurant_id = ?', swipe_right_params[:restaurant_id])
      .where('plan_id = ?', swipe_right_params[:plan_id])
      .first

    @swipe = restaurant.swipe_lefts.new(user_id: current_user.id)

    if @swipe.save
      render json: @swipe
    else
      render json: @swipe.errors.full_messages
    end
  end

  private
    def swipe_right_params
      params.require(:swipe_left).permit(:plan_id, :restaurant_id)
    end

end
