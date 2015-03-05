class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all_actives.paginate page: params[:page], per_page: 30
    flash[:notice] = 'Sin resultados.' if @games.empty?
  end

  def show
  end

  def new
    @game = Game.new
  end

  def edit
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to games_path, notice: 'Juego credo con éxito.'
    else
      render :new
    end
  end

  def update
    if @game.update(game_params)
      redirect_to games_path, notice: 'Juego actualizado con éxito.'
    else
      render :edit
    end
  end

  def destroy
    @game.inactivate
    TrashedRecord.create_trash @game
    respond_to do |format|
      redirect_to games_url, notice: 'Juego inactivado con éxito.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params[:game].permit(:name, :description, :image)
    end
end
