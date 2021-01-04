require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :movie_actors}
    it {should have_many(:actors), through: :movie_actors}
  end

  describe 'methods' do
    it 'average actor age' do
      @studio2 = Studio.create!(name: "Disney", location: "California")
      @movie3 = @studio2.movies.create!(title: "Frozen", creation_year: 2012, genre: "Family")
      @actor3 = @movie3.actors.create!(name: "Kristen Bell", age: 35)
      @actor4 = @movie3.actors.create!(name: "Idina Menzel", age: 33)

      expect(@movie3.average_actor_age).to eq(34)
    end
  end
end
