# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Queries::Sandbox::UserQuery do
  describe '#user' do
    subject(:result) { RailsGraphqlSandboxSchema.execute(query, variables: variables) }
    subject(:user_result) { result.dig('data', 'user') }

    before do
      user
    end

    let(:user) { create(:user) }

    let(:query) do
      <<~GRAPHQL
        query ($id: ID!) {
          user(id: $id) {
            id
            name
            email
          }
        }
      GRAPHQL
    end

    context 'When exits user' do
      let(:variables) { { id: user.id } }

      it 'Return user' do
        expect(user_result['id']).to eq user.id.to_s
        expect(user_result['name']).to eq user.name
        expect(user_result['email']).to eq user.email
      end

      it 'Empty errors' do
        expect(result['errors']).to be_blank
      end
    end
  end
end
