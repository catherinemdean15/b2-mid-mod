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


end
