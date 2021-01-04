class Actor <ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors


  def actors_worked_with
    movies.map do |movie|
      movie.actors
    end.flatten.uniq
  end

  def self.partial_match(keyword, column)
    where("#{column} like ?", "%#{keyword}%")
  end

end
