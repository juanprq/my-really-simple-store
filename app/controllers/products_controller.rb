class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all_actives.by_name.paginate page: params[:page], per_page: 30
    flash[:notice] = 'Sin resultados.' if @products.empty?
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admins_path, notice: 'Producto creado con éxito.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: 'Producto actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @product.inactivate
    TrashedRecord.create_trash @product
    redirect_to clients_url, notice: 'Producto inactivado con éxito.'
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params[:product]
    end
end
