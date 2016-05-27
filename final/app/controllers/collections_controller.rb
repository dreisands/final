class CollectionsController < ApplicationController

  def create
  	collection = Collection.new
    temp = params[:collection]
  	collection.user_id = session[:user_id].to_i
  	collection.game_id = temp[:game_id]
  	collection.date_added =  Date.today
  	collection.rating = temp[:rating]
    collection.save
    redirect_to user_url(session[:user_id])
  end

  def show
  end

  def new
  	@collection = Collection.new
  end

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  	collection = Collection.find_by(id: params[:id])
    if collection
      collection.delete
    end
    redirect_to user_url(session[:user_id])
  end
end