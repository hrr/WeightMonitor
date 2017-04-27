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
      datetime = "#{params[:weight][:date]}T#{params[:weight][:time]}"
      @weight_params ||= params.require(:weight).permit(:user_id, :entry, :date, :time)
      @weight_params.delete :date
      @weight_params.delete :time
      @weight_params.merge(registered: datetime)
    end
end
