# frozen_string_literal: true

module Mutations
  module Sandbox
    class UpdateUser < Mutations::BaseMutation
      description 'Update User'

      argument :user, InputObjects::Sandbox::UserInput, required: true, description: 'User Information', as: :user_input

      field :user, Types::Sandbox::UserType, null: false

      def resolve(user_input:)
        user = User.find(user_input.id.to_i)
        user.update!(
          name: user_input.name,
          email: user_input.email
        )

        { user: user }
      end
    end
  end
end
