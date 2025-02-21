# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
      # field :create_author, Types::AuthorType, null: true, description: "Create an athor" do
      #   argument :first_name, String, required: false, camelize: false
      #   argument :last_name, String, required: false, camelize: false
      #   argument :email, String, required: false
      #   argument :year_of_birth, Int, required: false, camelize: false
      #   argument :is_alive, Boolean, required: false, camelize: false
      # end

      # def create_author(first_name:, last_name:, email:, year_of_birth:, is_alive:)
      #   Author.create( first_name: first_name, last_name: last_name, email: email, year_of_birth: year_of_birth, is_alive: is_alive)
      # end

      field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor

      field :update_author, Boolean, null: true, description: "update an author" do
        argument :author, Types::AuthorInputType, required: true
      end

      def update_author(author:)

        obj = Author.find_by(id: author[:id])
        obj&.update(author.to_h)
      end

      field :delete_author, Boolean, null: false, description: "Delete an author" do
        argument :id, ID, required: true
      end

      def delete_author(id:)
        Author.where(id: id).destroy_all
        true
      end
  end
end
