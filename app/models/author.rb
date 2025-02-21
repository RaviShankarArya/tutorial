class Author < ApplicationRecord

	has_many :books

	validates :first_name, :last_name, presence: true

	def full_name
		"#{first_name} #{last_name}"
	end

	def published_books
		books.pluck(:title)
	end

end
