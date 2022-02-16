module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :create_user, mutation: Mutations::Sandbox::CreateUser
    field :update_user, mutation: Mutations::Sandbox::UpdateUser
    field :delete_user, mutation: Mutations::Sandbox::DeleteUser
  end
end
