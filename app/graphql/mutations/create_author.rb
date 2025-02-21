class Mutations::CreateAuthor < GraphQL::Schema::Mutation

	null true

	# argument :first_name, String, required: false, camelize: false
    # argument :last_name, String, required: false, camelize: false
    # argument :email, String, required: false
    # argument :year_of_birth, Int, required: false, camelize: false
    # argument :is_alive, Boolean, required: false, camelize: false

    # def resolve(first_name:, last_name:, email:, year_of_birth:, is_alive:)
    # 	Author.create( first_name: first_name, last_name: last_name, email: email, year_of_birth: year_of_birth, is_alive: is_alive)
    # end

    argument :author, Types::AuthorInputType, required: true

    def resolve(author:)
    	Author.create(author.to_h)
    end

end