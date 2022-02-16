# frozen_string_literal: true

module Queries
  module Sandbox
    class UserQuery < Queries::BaseQuery
      description 'User Information'

      argument :id, ID, required: true, description: 'User ID to get'

      # Return user
      def resolve(id:)
        # case id.to_i
        # when 1
        #   {
        #     id: 1,
        #     name: 'Tommy',
        #     email: 'tommy@example.com'
        #   }
        # when 2
        #   {
        #     id: 2,
        #     name: 'Chip',
        #     email: 'chip@example.com'
        #   }
        # end
        User.find_by(id: id.to_i)
      end
    end
  end
end
