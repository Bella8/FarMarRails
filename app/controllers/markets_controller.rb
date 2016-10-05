class MarketsController < ApplicationController
  def index
    
  end

  def market
    @market = "market"
    # Market.all
  end

  def user
    @market = "user"
  end
end
