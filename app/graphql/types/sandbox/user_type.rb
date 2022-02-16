# frozen_string_literal: true

module Types
  class Sandbox::UserType < Types::BaseObject
    description 'User'
    
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: false
  end
end
