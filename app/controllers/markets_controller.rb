class MarketsController < ApplicationController
  def index
    @markets_all = Market.all
  end
end
