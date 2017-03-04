class AdvicesController < ApplicationController
  before_action :require_is_admin, only: [:index]
  def index
    @advices = Advice.all
  end

  def new
    @advice = Advice.new
  end

  def create
    @advice = Advice.new(advice_params)
    if @advice.save
      flash[:notice] = "已提交"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def advice_params
    params.require(:advice).permit(:name, :description, :phone)
  end
end
