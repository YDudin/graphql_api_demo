# frozen_string_literal: true

module Types

  # Describes **Transaction** type model
  class TransactionType < Types::BaseObject

    field :unique_id, String, null: false, description: 'This field describes `unique_id` property of a user'
    field :amount,    String, null: false, description: 'This field describes `amount` property of a user'
    field :currency,  String, null: false, description: 'This field describes `currency` property of a user'
    field :status,    String, null: false, description: 'This field describes `status` property of a user'

  end

end
