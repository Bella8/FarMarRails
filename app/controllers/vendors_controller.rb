class VendorsController < ApplicationController

  def destroy
      @market = Market.find(params[:market_id])
      @vendor = Vendor.find(params[:id]).destroy
      redirect_to market_path(@market.id)
      # redirect_to market_path
  end

  def new_market_vendor
    market = Market.find(params[:market_id])
    @vendor = market.vendors.new
  end

  # def destroy
  #   Market.find(params[:id]).destroy
  #   redirect_to markets_path
  # end
  # def edit
  # # id = params[:market_id]
  #   market = Market.find(params[:market_id])
  #   @vendors = market.vendors.find(params[:id])
  # end


  def edit
  # id = params[:market_id]
    @market = Market.find(params[:market_id])
    @vendor = Vendor.find(params[:id])
  end

  def new_market_vendor
    @market = Market.find(params[:market_id])
    @vendor = market.vendors.new
  end
end
