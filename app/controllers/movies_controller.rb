class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    actor = Actor.where("#{"name"} like ?", "%#{params[:actor]}%")
    movie = Movie.find(params[:id])
    MovieActor.create!(actor_id: actor[0].id, movie_id: movie.id)
    redirect_to "/movies/#{movie.id}"
  end


end
