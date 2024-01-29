# spec/feature/integration_spec.rb
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

    visit book_path(Book.last)
    
    expect(page).to have_content('picture of dorian grey')
    expect(page).to have_content('oscar wilde')
    expect(page).to have_content('15') 
    expect(page).to have_content('2024-01-18')
    expect(page).to have_content('Penguin')
    expect(page).to have_content('150')
    expect(page).to have_content('2024-02-01')
  end

  scenario 'invalid input - empty title' do
    visit new_book_path
    fill_in "book[author]", with: 'oscar wilde'
    fill_in "book[cost]", with: 15
    fill_in "book[publication_date]", with: '18/01/2024'
    fill_in "book[publisher]", with: 'Penguin'
    fill_in "book[pages]", with: 150
    fill_in "book[release_date]", with: '01/02/2024'
    click_on 'Create Book'

    expect(page).to have_content("Title can't be blank")
  end

  scenario 'invalid input - empty author' do
    visit new_book_path
    fill_in "book[title]", with: 'picture of dorian grey'
    fill_in "book[cost]", with: 15
    fill_in "book[publication_date]", with: '18/01/2024'
    fill_in "book[publisher]", with: 'Penguin'
    fill_in "book[pages]", with: 150
    fill_in "book[release_date]", with: '01/02/2024'
    click_on 'Create Book'

    expect(page).to have_content("Author can't be blank")
  end

  scenario 'invalid input - negative cost' do
    visit new_book_path
    fill_in "book[title]", with: 'invalid book'
    fill_in "book[author]", with: 'author'
    fill_in "book[cost]", with: -5
    fill_in "book[publication_date]", with: '18/01/2024'
    fill_in "book[publisher]", with: 'Penguin'
    fill_in "book[pages]", with: 150
    fill_in "book[release_date]", with: '01/02/2024'
    click_on 'Create Book'

    expect(page).to have_content("Cost must be greater than or equal to 0")
  end

  scenario 'invalid input - empty publication date' do
    visit new_book_path
    fill_in "book[title]", with: 'picture of dorian grey'
    fill_in "book[author]", with: 'author'
    fill_in "book[cost]", with: 15
    fill_in "book[publisher]", with: 'Penguin'
    fill_in "book[pages]", with: 150
    fill_in "book[release_date]", with: '01/02/2024'
    click_on 'Create Book'

    expect(page).to have_content("Publication date can't be blank")
  end

  scenario 'invalid input - empty publisher' do
    visit new_book_path
    fill_in "book[title]", with: 'picture of dorian grey'
    fill_in "book[author]", with: 'author'
    fill_in "book[cost]", with: 15
    fill_in "book[publication_date]", with: '18/01/2024'
    fill_in "book[pages]", with: 150
    fill_in "book[release_date]", with: '01/02/2024'
    click_on 'Create Book'

    expect(page).to have_content("Publisher can't be blank")
  end

  scenario 'invalid input - negative pages' do
    visit new_book_path
    fill_in "book[title]", with: 'picture of dorian grey'
    fill_in "book[author]", with: 'author'
    fill_in "book[cost]", with: 15
    fill_in "book[publication_date]", with: '18/01/2024'
    fill_in "book[publisher]", with: 'Penguin'
    fill_in "book[pages]", with: -1
    fill_in "book[release_date]", with: '01/02/2024'
    click_on 'Create Book'

    expect(page).to have_content("Pages must be greater than 0")
  end

  scenario 'invalid input - empty release date' do
    visit new_book_path
    fill_in "book[title]", with: 'picture of dorian grey'
    fill_in "book[author]", with: 'author'
    fill_in "book[cost]", with: 15
    fill_in "book[publication_date]", with: '18/01/2024'
    fill_in "book[publisher]", with: 'Penguin'
    fill_in "book[pages]", with: -1
    click_on 'Create Book'

    expect(page).to have_content("Release date can't be blank")
  end
end
