require 'rails_helper'

RSpec.describe 'studio index page' do
  before :each do
    @studio1 = Studio.create!(name: "Universal", location: "Florida")
    @studio2 = Studio.create!(name: "Disney", location: "California")
  end

  it 'lists all of the movie studios' do
    visit "/studios"

    expect(page).to have_content(@studio1.name)
    expect(page).to have_content(@studio2.name)
  end

end
