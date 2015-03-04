class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @q = params[:q]
    query = Client.all_actives
    if @q and !@q.empty?
      query = query.search_by_all @q
    end
    @clients = query.by_name.paginate page: params[:page], per_page: 30
    flash[:notice] = 'Sin resultados.' if @clients.empty?
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.create(client_params)
    if @client.valid?
      redirect_to clients_path, notice: 'Cliente agregado con éxito'
    else
      render :new
    end
  end

  def update
    if @client.update client_params
      redirect_to clients_path, notice: 'Cliente actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @client.inactivate
    TrashedRecord.create_trash @client
    redirect_to clients_url, notice: 'Cliente inactivado con éxito.'
  end

  private

    def set_client
      @client = Client.all_actives.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :identification, :phone, :email)
    end
end
