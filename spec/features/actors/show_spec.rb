require 'rails_helper'

RSpec.describe 'actor show page' do
  before :each do
    @studio2 = Studio.create!(name: "Disney", location: "California")
    @movie3 = @studio2.movies.create!(title: "Frozen", creation_year: 2012, genre: "Family")
    @actor1 = @movie3.actors.create!(name: "Josh Gad", age: 35)
    @actor2 = @movie3.actors.create!(name: "Jonathan Groff", age: 28)
    @actor3 = @movie3.actors.create!(name: "Kristen Bell", age: 35)
    @actor4 = @movie3.actors.create!(name: "Idina Menzel", age: 33)

  end

  it 'shows the actor name and age' do
    visit "/actors/#{@actor3.id}"

    expect(page).to have_content(@actor3.name)
    expect(page).to have_content(@actor3.age)
  end

  it 'creates a unique list of actors worked with' do
    @movie1 = @studio2.movies.create!(title: "Frozen 2", creation_year: 2019, genre: "Family")
    MovieActor.create!(actor_id: @actor3.id, movie_id: @movie1.id)
    MovieActor.create!(actor_id: @actor4.id, movie_id: @movie1.id)

    visit "/actors/#{@actor3.id}"

    expect(page).to have_content("Josh Gad, Jonathan Groff, Kristen Bell, Idina Menzel,")
  end


end
