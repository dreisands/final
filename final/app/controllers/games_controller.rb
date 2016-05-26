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
  	game.title = params[:title]
  	game.cover_url = params[:cover_url]
  	game.min_age = params[:min_age]
  	game.year = params[:year]
  	game.description = params[:description]
  	game.min_playtime = params[:min_playtime]
  	game.max_playtime = params[:max_playtime]
  	game.min_players = params[:min_players]
  	game.max_players = params[:max_players]
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
    game.title = params[:title]
  	game.cover_url = params[:cover_url]
  	game.min_age = params[:min_age]
  	game.year = params[:year]
  	game.description = params[:description]
  	game.min_playtime = params[:min_playtime]
  	game.max_playtime = params[:max_playtime]
  	game.min_players = params[:min_players]
  	game.max_players = params[:max_players]
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