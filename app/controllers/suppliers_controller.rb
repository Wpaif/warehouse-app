class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to supplier_path(@supplier), notice: 'Fornecedor cadastrado com sucesso'
    else
      flash.now[:notice] = 'Fornecedor não foi cadastrado'
      render :new
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update(supplier_params)
      redirect_to supplier_path(@supplier), notice: 'Fornecedado atualizado com sucesso'
    else
      flash[:notice] = 'Não foi possível atualizar o fornecedor'
      render :edit
    end
  end

  private

  def supplier_params
    params.require('supplier').permit(:brand_name, :corporate_name, :registered_number,
                                      :full_address, :email, :phone_number)
  end
end
