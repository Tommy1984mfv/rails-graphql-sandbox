# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::Sandbox::UpdateUser do
  describe '#update_user' do
    subject(:result) { RailsGraphqlSandboxSchema.execute(mutation, variables: variables) }
    subject(:user_result) { result.dig('data', 'updateUser', 'user') }

    before do
      user
    end

    let(:user) { create(:user) }

    let(:mutation) do
      <<~GRAPHQL
        mutation($input: UpdateUserInput!) {
          updateUser(input: $input) {
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
              id: user.id.to_s,
              name: 'user_update',
              email: 'user_update@example.com'
            }
          }
        }
      end

      it 'is success' do
        expect { subject }.to change(User, :count).by(0)
        expect(user_result['id']).to eq user.id.to_s
        expect(user_result['name']).to eq 'user_update'
        expect(user_result['email']).to eq 'user_update@example.com'
      end

      it 'no error' do
        expect(result['errors']).to be_blank
      end
    end
  end
end
