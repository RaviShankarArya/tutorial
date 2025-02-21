class Types::AuthorType < Types::BaseObject

	description "Author Details"

	field :id, ID, null: false
	field :first_name, String, null: true, camelize: false
	field :last_name, String, null: true, camelize: false
	field :email, String, null: true
	field :year_of_birth, Int, null: false
	field :is_alive, Boolean, null: true

	field :full_name, String, null: false, camelize: false
	field :published_books, [String], null: false, camelize: false
	field :errors, [Types::ErrorType], null: true

	def errors
		object.errors.map{ |e| {field_name: e.attribute, errors: object.errors[e.attribute]}}
	end

	def authorized?(object, context)
		binding.pry
	end

end 


class Types::AuthorInputType < GraphQL::Schema::InputObject
	graphql_name "AuthorInputType"
	description "All the attributes needed to create/update an author"

	argument :id, ID, required: false
	argument :first_name, String, required: false, camelize: false
  argument :last_name, String, required: false, camelize: false
  argument :email, String, required: false
  argument :year_of_birth, Int, required: false, camelize: false
  argument :is_alive, Boolean, required: false, camelize: false
end