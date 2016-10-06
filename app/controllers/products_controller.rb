class ProductsController < ApplicationController
  def new
    vendor_id = params[:vendor_id]
    vendor = Vendor.find(vendor_id)
    @vendor_product = vendor.products.build
  end

  def create
    vendor_id = params[:vendor_id]
    vendor = Vendor.find(vendor_id)
    @vendor_product = vendor.products.create(vendor_product_params)

    redirect_to vendor_path(vendor_id)
  end

  private

  def  vendor_product_params
    params.require(:product).permit(:name, :vendor_id)
  end
end
