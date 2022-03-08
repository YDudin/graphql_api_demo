# frozen_string_literal: true

module Types

  # Describes **User** type model
  class UserType < Types::BaseObject

    field :login_name,   String,            null: false, description: 'This field describes `login name` property of a user'
    field :first_name,   String,            null: false, description: 'This field describes `first name` property of a user'
    field :name,         String,            null: false, description: 'This field describes user `full name`'
    field :last_name,    String,            null: false, description: 'This field describes `last_name` property of a user'
    field :type,         String,            null: false, description: 'This field describes `type` property of a user'
    field :role,         String,            null: false, description: 'This field describes `role` property of a user'
    field :active,       String,            null: false, description: 'This field describes `active` property of a user'
    field :transactions, [TransactionType], null: true,  description: 'Provides a list with all user transactions'

    def name
      "#{object.first_name} #{object.last_name}"
    end

    def transactions
      object.transactions
    end

  end

end
