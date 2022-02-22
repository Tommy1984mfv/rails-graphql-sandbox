# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::Sandbox::CreateUser do
  describe '#create_user' do
    subject(:result) { RailsGraphqlSandboxSchema.execute(mutation, variables: variables) }
    subject(:user_result) { result.dig('data', 'createUser', 'user') }

    let(:mutation) do
      <<~GRAPHQL
        mutation($input: CreateUserInput!) {
          createUser(input: $input) {
            user {
              id
              email
              name
            }
          }
        }
      GRAPHQL
    end

    context 'When normal' do
      let(:variables) do
        {
          input: {
            user: {
              name: 'user_test',
              email: 'user_test@example.com'
            }
          }
        }
      end

      it 'is success' do
        expect { subject }.to change(User, :count).by(1)
        expect(user_result['name']).to eq 'user_test'
        expect(user_result['email']).to eq 'user_test@example.com'
      end

      it 'no error' do
        expect(result['errors']).to be_blank
      end
    end
  end
end
