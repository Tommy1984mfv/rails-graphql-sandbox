# frozen_string_literal: true

module Mutations
  module Sandbox
    class DeleteUser < Mutations::BaseMutation
      description 'Delete User'

      argument :id, ID, required: true, description: 'User ID'
      
      field :user, Types::Sandbox::UserType, null: true

      def resolve(id:)
        User.find(id).destroy!
        {}
      end
    end
  end
end
