class Api::PlansController < ApplicationController

  def create
    @plan = PlanParser.new().parse(plan_params)
    if @plan.save
      render :show
    else
      render json: @plan.errors.full_messages
    end
  end

  def show
  end

  private
    def plan_params
      params.require(:plan).permit(:name, :time, :location, categories: [], friend_ids: [])
    end
end