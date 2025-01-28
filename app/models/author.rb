# class Author < ApplicationRecord
class Author < SubRecord
  has_many :book_authors
  has_many :books, through: :book_authors
end
