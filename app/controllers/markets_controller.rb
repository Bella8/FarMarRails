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

  def show
    id = params[:id]
    @market = Market.find(id)
    @vendors = @market.vendors

    @link = "market"
  end

  def user_show
    id = params[:id]
    @market = Market.find(id)
    @vendors = @market.vendors
    @link = "user"
    render "show"
  end
   # to use the vender edit paage to edit
  # def edit_market_vendor
  # # id = params[:market_id]
  #   market = Market.find(params[:market_id])
  #   @vendors = market.vendors.find(params[:id])
  # end

  # use the vendor new page to create new
  # have it stop throwing errors
  # def new_market_vendor
  #   market = Market.find(params[:market_id])
  #   @vendor = market.vendors.new
  # end

# to have it delete
# have it stop throwing errors
  # def market_vendor_destroy
  #     market = Market.find(params[:market_id])
  #     vendor = market.vendors.find(params[:id])
  #     @vendor = vendor.destroy
  #     if @vendor == nil
  #       @msg = "vendor is nil"
  #     end
  #     redirect_to  market_vendor
  # end



  #
  # def edit
  #    @user = User.find_by(username: params[:username])
  #  end


  def destroy
    Market.find(params[:id]).destroy
    redirect_to markets_path
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.find(params[:id])
      if @market.update(market_params)
      redirect_to markets_path
    else
      render :edit
    end
  end

  private
def  market_params
  params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
end
end
