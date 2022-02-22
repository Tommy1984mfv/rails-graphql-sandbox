# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Queries::Sandbox::UsersQuery do
  describe '#users' do
    subject(:result) { RailsGraphqlSandboxSchema.execute(query, variables: variables) }
    subject(:users_result) { result.dig('data', 'users', 'nodes') }

    before do
      users
    end

    let(:users) { create_list(:user, 2) }

    let(:query) do
      <<~GRAPHQL
        query {
          users {
            nodes {
              id
              name
              email
            }
          }
        }
      GRAPHQL
    end

    let(:variables) { nil }

    context 'with have data' do
      it 'is success' do
        expect(users_result.count).to eq(2)
      end

      it 'Empty errors' do
        expect(result['errors']).to be_blank
      end
    end
  end
end
