class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  def index
    @admins = Admin.all.by_email.paginate page: params[:page], per_page: 30
    flash[:notice] = 'Sin resultados.' if @admins.empty?
  end

  def show
  end

  def new
    @admin = Admin.new
  end

  def edit
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to @admin, notice: 'Administrador agregado con éxito.'
    else
      render :new
    end
  end

  def update
    if @admin.update(admin_params)
      redirect_to admins_path, notice: 'Administrador actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @admin.destroy
    redirect_to admins_url, notice: 'Administrador eliminado con éxito.'
  end

  private
    
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params[:admin].permit(:name, :identification, :phone, :email)
    end
end
