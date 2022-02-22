require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    user
  end

  let(:user) { create(:user) }
  
  it 'test ok' do
    expect(User.count).to eq(1)
  end
end
