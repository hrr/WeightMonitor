class WeightsController < ApplicationController
  def create
    @user = User.find(params[:weight][:user][:id])
    @user.weights.build(params[:weight][:entry])
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
      #params.require(:weights).permit(:id, :entry)
    end
end
