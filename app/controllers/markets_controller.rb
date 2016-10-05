class MarketsController < ApplicationController

def mainpage
end

  def index
    @markets = Market.all
    @link = "market"
  end

  def new
    @market = Market.new
  end

  def create
    @new_market_create = Market.new(market_params) #task_params is a method
    if @new_market_create.save
      redirect_to markets_path
    else
      render :new
    end
  end

  def user_all
    @markets = Market.all
    @link = "user"
    render "index"
  end

  def user_show
    id = params[:id]
    @market = Market.find(id)
    @vendors = @market.vendors
    @link = "market"
    render "show"
  end

  private
def  market_params
  params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
end
end
