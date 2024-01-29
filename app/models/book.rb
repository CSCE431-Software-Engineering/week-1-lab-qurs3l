class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :cost, numericality: { greater_than_or_equal_to: 0 }
  validates :publication_date, presence: true
  validates :publisher, presence: true
  validates :pages, numericality: { only_integer: true, greater_than: 0 }
  validates :release_date, presence: true
end
