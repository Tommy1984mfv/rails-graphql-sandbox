# frozen_string_literal: true

module Types
  module Guest
    class MutationType < Types::BaseObject
      field :create_user, mutation: Mutations::Sandbox::CreateUser
    end
  end
end
