class GameSessionsController < ApplicationController
 def index
    @game_sessions = GameSession.all

    respond_to do |format|
      format.html do
        render 'index'
      end
      format.json do
        render json: @game_sessions
      end
      format.xml do
        render xml: @game_sessions
      end
    end

  end
end