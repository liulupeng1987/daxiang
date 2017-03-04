class SubscribersController < ApplicationController
  before_action :require_is_admin, only: [:index]
  def index
    @subscribers = Subscriber.all
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      flash[:notice] = "已订阅"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email)
  end
end
