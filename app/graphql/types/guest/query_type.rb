# frozen_string_literal: true

module Types
  class Guest::QueryType < Types::BaseObject
    field :user, Sandbox::UserType, null: true, resolver: Queries::Sandbox::UserQuery

    field :users, Sandbox::UserType.connection_type, null: false, resolver: Queries::Sandbox::UsersQuery
  end
end
