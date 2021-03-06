class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
    studio = Studio.where("#{"name"} like ?", "%#{params[:studio]}%")
    studio[0].movies.create!(movie_params)
    redirect_to "/movies"
  end

  def update
      actor = Actor.partial_match(params[:actor], "name")
      movie = Movie.find(params[:id])
      MovieActor.create!(actor_id: actor[0].id, movie_id: movie.id)
      redirect_to "/movies/#{movie.id}"
  end

  def search
    actor = Actor.partial_match(params[:actor], "name")
    @movies = actor[0].movies
    render :show
  end

  private
  def movie_params
    params.permit(:title, :creation_year, :genre)
  end

end
