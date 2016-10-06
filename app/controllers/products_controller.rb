class ProductsController < ApplicationController
  def new
    id = params[:vendor_id]
    @vendor = Vendor.find(id)
    @vendor_product = @vendor.products.build
  end


  private

  # def  vendor_product_params
  #   params.require(:product).permit(:name)
  # end
end
