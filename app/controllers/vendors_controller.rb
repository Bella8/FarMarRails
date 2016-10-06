class VendorsController < ApplicationController

  def index
    @vendors_all = Vendor.all
  end

  def show
    id = params[:id]
    @vendor = Vendor.find(id)
    @products = @vendor.products
    @sales = sales(@products)
    @vendor_market = Market.find(@vendor.market_id).name
    @sales_total = sales_total(@sales)

    if !(@sales.empty?)
      @attribute_keys = @sales.first.attributes.keys #doesn't work if no sales
    end
  end



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

  def destroy
    Market.find(params[:id]).destroy
    redirect_to markets_path
  end

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


  private

  def sales(products)
    sales = []
    products.each do |product|
      sales += product.sales
    end
    return sales
  end

  def sales_total(sales)
    total_amount = 0
    sales.each do |sale|
      total_amount += sale.amount
    end
    total_amount = total_amount/100.0
    return total_amount
  end


  # def  vendor_params
  #   params.require(:vendor).permit(:name, :number_of_employees)
  # end
