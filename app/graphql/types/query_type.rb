# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator" do 
        argument :name, String, required: true
      end
    def test_field(name:)
      "Welcome to GraphQL #{name}!!!!!"
    end

    field :author, Types::AuthorType, null: true,
      description: "Returns the Author Details" do
        argument :id, ID, required: true      
    end

    def author(id:)
      Author.where(id: id).first
    end

    field :login, String, null: true, description: "login an user" do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      user = User.where(email: email).first&.authenticate(password)
      if user
        user.sessions.create.key
      end
    end

    field :current_user, Types::UserType, null: true, description: "current user details"

    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: true, description: "logout an user"

    def logout
      Session.where(id: context[:session_id]).destroy_all
      true
    end
  end
end
