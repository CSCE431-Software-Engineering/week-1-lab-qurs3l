# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'picture of dorian grey'
    fill_in "book[author]", with: 'oscar wilde'
    fill_in "book[cost]", with: 15
    fill_in "book[publication_date]", with: '18/01/2024'
    fill_in "book[publisher]", with: 'Penguin'
    fill_in "book[pages]", with: 150
    fill_in "book[release_date]", with: '01/02/2024'
    click_on 'Create Book'
    
    # Assuming you have a show page for a book where all attributes are displayed
    visit book_path(Book.last)
    
    expect(page).to have_content('picture of dorian grey')
    expect(page).to have_content('oscar wilde')
    expect(page).to have_content('15') 
    expect(page).to have_content('2024-01-18')
    expect(page).to have_content('Penguin')
    expect(page).to have_content('150')
    expect(page).to have_content('2024-02-01')
  end
  
end
