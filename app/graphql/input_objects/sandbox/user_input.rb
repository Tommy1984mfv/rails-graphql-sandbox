# frozen_string_literal: true

module InputObjects
  module Sandbox
    class UserInput < Types::BaseInputObject
      description 'Create, update user information'

      argument :id, Int, required: false
      argument :name, String, required: false
      argument :email, String, required: true
    end
  end
end
