# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::Sandbox::UpdateUser do
  describe '#delete_user' do
    subject(:result) { RailsGraphqlSandboxSchema.execute(mutation, variables: variables) }
    subject(:user_result) { result.dig('data', 'deleteUser', 'clientMutationId') }

    before do
      user
    end

    let(:user) { create(:user) }

    let(:mutation) do
      <<~GRAPHQL
        mutation ($input: DeleteUserInput!) {
          deleteUser(input: $input) {
            clientMutationId
          }
        }
      GRAPHQL
    end

    context 'When normal' do
      let(:variables) do
        {
          input: {
            id: user.id
          }
        }
      end

      it 'is success' do
        expect { subject }.to change(User, :count).by(-1)
        expect(user_result).to eq nil
      end

      it 'no error' do
        expect(result['errors']).to be_blank
      end
    end
  end
end
