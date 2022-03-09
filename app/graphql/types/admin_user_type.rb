# frozen_string_literal: true

module Types

  # Describes **AdminUser** type model
  class AdminUserType < Types::BaseObject

    implements UserInterface

    field :phone, String, null: false, description: 'Admin user phone'

  end

end
