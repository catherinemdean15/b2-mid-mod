require 'rails_helper'

RSpec.describe 'studio index page' do
  before :each do
    @studio1 = Studio.create!(name: "Universal", location: "Florida")
    @studio2 = Studio.create!(name: "Disney", location: "California")
    @movie1 = @studio1.movies.create!(title: "The best movie ever!", creation_year: 2003, genre: "Action")
    @movie2 = @studio1.movies.create!(title: "The second best movie ever!", creation_year: 2014, genre: "Action")
    @movie3 = @studio2.movies.create!(title: "Frozen", creation_year: 2012, genre: "Family")
  end

  it 'lists all of the studios' do
    visit "/studios"

    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio2.name)
  end

  it 'lists all of the movies in the studio' do
    visit "/studios"

    expect(page.all('#movie')[0]).to have_content(@movie1.title)
    expect(page.all('#movie')[0]).to have_content(@movie2.title)
    expect(page.all('#movie')[1]).to have_content(@movie3.title)
  end

end
