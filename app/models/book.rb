class Book < ApplicationRecord
	belongs_to :user

	validates :book_opinion,    length: { in: 1..200 }, presence: true
	validates :book_title,    length: { minimum: 1 }, presence: true
end
