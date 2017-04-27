class WeightsController < ApplicationController
  def create
    @weight = Weight.new(weight_params)
    if @weight.save
      render json: @weight
    else
      render json: @weight.errors, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private
    def weight_params
      params.require(:weight).permit(:user_id, :entry)
    end
end
