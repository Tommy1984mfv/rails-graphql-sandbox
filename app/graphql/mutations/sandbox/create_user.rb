# frozen_string_literal: true

module Mutations
  module Sandbox
    class CreateUser < Mutations::BaseMutation
      description 'Create User'

      argument :user, InputObjects::Sandbox::UserInput, required: true, description: 'User Information', as: :user_input

      field :user, Types::Sandbox::UserType, null: false

      def resolve(user_input:)
        # {
        #   user: {
        #     id: 3,
        #     name: user_input.name,
        #     email: user_input.email
        #   }
        # }
        user = User.create!(
          email: user_input.email,
          name: user_input.name
        )
        { user: user }
      end
    end
  end
end
