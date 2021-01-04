require 'rails_helper'

RSpec.describe 'movies index page' do
  before :each do
    @studio1 = Studio.create!(name: "Universal", location: "Florida")
    @studio2 = Studio.create!(name: "Disney", location: "California")
    @movie1 = @studio1.movies.create!(title: "The best movie ever!", creation_year: 2003, genre: "Action")
    @movie2 = @studio1.movies.create!(title: "The second best movie ever!", creation_year: 2014, genre: "Action")
    @movie3 = @studio2.movies.create!(title: "Frozen", creation_year: 2012, genre: "Family")
  end

  it 'displays all movies' do
    visit '/movies'

    expect(page).to have_content(@movie1.title)
    expect(page).to have_content(@movie2.title)
    expect(page).to have_content(@movie3.title)
  end

  it 'can add a new movie' do
    visit '/movies'

    fill_in 'Title', with: 'Title'
    fill_in 'Creation year', with: '2020'
    fill_in 'Genre', with: 'Comedy'
    fill_in 'Studio', with: 'Disney'
    click_button 'Create new movie'

    expect(page).to have_content('Title')


  end

  it "links to the movie show page" do
    visit '/movies'

    click_link "#{@movie1.title}"
    expect(page).to have_current_path("/movies/#{@movie1.id}")

  end

end
