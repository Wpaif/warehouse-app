class ProductModelsController < ApplicationController
  def index
    @product_models = ProductModel.all
  end

  def show
    @product_model = ProductModel.find(params[:id])
  end

  def new
    @product_model = ProductModel.new
    @suppliers = Supplier.all
  end

  def create
    @product_model = ProductModel.new(product_model_params)
    if @product_model.save
      redirect_to product_model_path(@product_model), notice: 'Produto criado com sucesso'
    else
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
