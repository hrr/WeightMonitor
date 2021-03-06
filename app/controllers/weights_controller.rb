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
    @weight = Weight.find(params[:id])
    @weight.destroy
    head :no_content
  end

  def update
    @weight = Weight.find(params[:id])
    if @weight.update(weight_params)
      render json: @weight
    else
      render json: @weight.errors, status: :unprocessable_entity
    end
  end

  private
    def weight_params
      params.require(:weight).permit(:user_id, :entry, :date, :time)
    end
end
