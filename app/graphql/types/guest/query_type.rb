# frozen_string_literal: true

module Types
  class Guest::QueryType < Types::BaseObject
    field :user, Sandbox::UserType, null: true do
      argument :id, ID, required: true, description: 'User ID to get'
    end

    field :users, Sandbox::UserType.connection_type, null: false

    def user(id:)
      User.find_by(id: id.to_i)
    end

    def users
      User.all.order(created_at: :desc)
    end
  end
end
