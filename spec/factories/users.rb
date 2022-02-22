# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    name do 'test01' end
    email do 'test01@example.com' end
  end
end
