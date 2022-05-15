class ProductModelsController < ApplicationController
  def index
    @product_models = ProductModel.all
  end

  def show
    @product_model = ProductModel.find(params[:id])
  end

  def new
    @product_model = ProductModel.new
  end
  
  def create
    @product_model = ProductModel.new(product_model_params)
    @suppliers = Supplier.all
    if @product_model.save
      redirect_to product_model_path(@product_model), notice: 'Produto criado com sucesso'
    else
      @suppliers = Supplier.all
      flash[:notice] = 'O produto não pode ser criado'
      render :new
    end
  end

  private

  def product_model_params
    params.require(:product_model).permit(:name, :weight, :width, :height,
                                          :depth, :sku, :supplier_id)
  end
end
