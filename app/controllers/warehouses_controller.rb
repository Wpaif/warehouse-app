class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      return redirect_to root_path
    end

    re
  end

  private

  def warehouse_params
    params.require('warehouse').permit(:name, :description, :code,
                                       :address, :city, :cep, :area)
  end
end
