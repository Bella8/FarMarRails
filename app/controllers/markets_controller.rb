class MarketsController < ApplicationController

def mainpage
end

  def index
    @markets = Market.all
    @link = "market"
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
    @link= "market"
    render "show"
  end
end
