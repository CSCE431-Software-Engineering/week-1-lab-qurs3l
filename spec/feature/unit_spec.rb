# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(
        title: 'picture of dorian grey',
        author: 'oscar wilde',
        cost: 15,
        publication_date: '18/01/2024',
        publisher: 'penguin',
        pages: 150,
        release_date: '01/02/2024'
    )
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid with a negative price' do
    subject.cost = -1
    expect(subject).not_to be_valid
  end

  it 'is not valid without a publication date' do
    subject.publication_date = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a publisher' do
    subject.publisher = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid with negative pages' do
    subject.pages = -1
    expect(subject).not_to be_valid
  end

  it 'is not valid without a release date' do
    subject.release_date = nil
    expect(subject).not_to be_valid
  end
end