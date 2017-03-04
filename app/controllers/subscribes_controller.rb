class SubscribesController < ApplicationController
  before_action :require_is_admin, only: [:index]
  def index
    @subscribes = Subscribe.all
  end

  def new
    @subscribe = Subscribe.new
  end

  def create
    @subscribe = Subscribe.new(subscribe_params)
    if @subscribe.save
      flash[:notice] = "已提交"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def subscribe_params
    params.require(:subscribe).permit(:booktitle, :bookauthor, :email, :phone)
  end

end
