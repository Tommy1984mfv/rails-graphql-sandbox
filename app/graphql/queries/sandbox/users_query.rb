# frozen_string_literal: true

module Queries
  module Sandbox
    class UsersQuery < Queries::BaseQuery
      description 'List Users'

      # Return users
      def resolve
        # [
        #   {
        #     id: 1,
        #     name: 'Tommy',
        #     email: 'tommy@example.com'
        #   },
        #   {
        #     id: 2,
        #     name: 'Chip',
        #     email: 'chip@example.com'
        #   }
        # ]
        User.all.order(created_at: :desc)
      end
    end
  end
end
