require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it {should have_many :movie_actors}
    it {should have_many(:movies), through: :movie_actors}
  end

  describe 'methods' do
    it 'actors_worked_with' do
      @studio2 = Studio.create!(name: "Disney", location: "California")
      @movie3 = @studio2.movies.create!(title: "Frozen", creation_year: 2012, genre: "Family")
      @actor1 = @movie3.actors.create!(name: "Josh Gad", age: 35)
      @actor2 = @movie3.actors.create!(name: "Jonathan Groff", age: 28)
      @actor3 = @movie3.actors.create!(name: "Kristen Bell", age: 35)
      @actor4 = @movie3.actors.create!(name: "Idina Menzel", age: 33)
      @movie1 = @studio2.movies.create!(title: "Frozen 2", creation_year: 2019, genre: "Family")
      MovieActor.create!(actor_id: @actor3.id, movie_id: @movie1.id)
      MovieActor.create!(actor_id: @actor4.id, movie_id: @movie1.id)

      expect(@actor3.actors_worked_with).to eq([@actor1, @actor2, @actor3, @actor4])


    end

  end
end
