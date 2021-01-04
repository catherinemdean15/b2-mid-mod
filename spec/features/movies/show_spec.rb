require 'rails_helper'

RSpec.describe 'movie show page' do
  before :each do
    @studio2 = Studio.create!(name: "Disney", location: "California")
    @movie3 = @studio2.movies.create!(title: "Frozen", creation_year: 2012, genre: "Family")
    @actor3 = @movie3.actors.create!(name: "Kristen Bell", age: 35)
    @actor4 = @movie3.actors.create!(name: "Idina Menzel", age: 33)
  end

  it 'lists movie title, creation year, and genre' do
    visit "/movies/#{@movie3.id}"

    expect(page).to have_content(@movie3.title)
    expect(page).to have_content(@movie3.creation_year)
    expect(page).to have_content(@movie3.genre)
  end

  it 'lists all actors youngest to oldest' do
    visit "/movies/#{@movie3.id}"
    
    expect(page.all('#name')[0]).to have_content("Idina Menzel")
    expect(page.all('#name')[1]).to have_content("Kristen Bell")

  end

  it 'displays the average actor age' do
    visit "/movies/#{@movie3.id}"

    expect(page).to have_content(34)
  end


end
