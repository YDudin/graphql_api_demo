# frozen_string_literal: true

module Types

  # Describes **ConsumerUser** type model
  class ConsumerUserType < Types::BaseObject

    implements UserInterface

    field :email, String, null: false, description: 'Consumer user email'

  end

end
