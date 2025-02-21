class Types::UserType < Types::BaseObject
	description "User details"

	field :id, ID, null: false
	field :name, String, null: true, camelize: false 
	field :email, String, null: true

	def visible?(context)
		context[:current_user].present?
	end
end