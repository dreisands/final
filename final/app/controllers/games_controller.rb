class GamesController < ApplicationController
 def index
    @games = Game.all
    if params[:keyword].present?
      @games = @games.where("title LIKE ? OR year = ?", "%#{params[:keyword]}%", params[:keyword])
    end

    respond_to do |format|
      format.html do
        render 'index'
      end
      format.json do
        render json: @games
      end
      format.xml do
        render xml: @games
      end
    end

  end

  def create
  	game = Game.new
    temp = params[:game]
  	game.title = temp[:title]
  	game.cover_url = temp[:cover_url]
  	game.min_age = temp[:min_age]
  	game.year = temp[:year]
  	game.description = temp[:description]
  	game.min_playtime = temp[:min_playtime]
  	game.max_playtime = temp[:max_playtime]
  	game.min_players = temp[:min_players]
  	game.max_players = temp[:max_players]
    game.save
    redirect_to games_url
  end

  def show
    @game = Game.find_by(id: params[:id])
    if @game == nil
      redirect_to games_url
    end
    session["game_id"] = @game.id
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def update
    game = Game.find_by(id: params[:id])
    temp = params[:game]
    game.title = temp[:title]
  	game.cover_url = temp[:cover_url]
  	game.min_age = temp[:min_age]
  	game.year = temp[:year]
  	game.description = temp[:description]
  	game.min_playtime = temp[:min_playtime]
  	game.max_playtime = temp[:max_playtime]
  	game.min_players = temp[:min_players]
  	game.max_players = temp[:max_players]
    game.save
    redirect_to games_url(@game)
  end

  def destroy
  	game = Game.find_by(id: params[:id])
    if game
      game.delete
    end
    redirect_to games_url
  end
end