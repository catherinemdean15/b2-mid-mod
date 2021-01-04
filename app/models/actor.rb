class Actor <ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors


  def actors_worked_with
    movies.map do |movie|
      movie.actors
    end.flatten.uniq
  end

end
