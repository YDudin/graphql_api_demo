module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [UserType], null: false, description: 'Show all users basic details'
    def users
      User.all
    end

    field :transactions, [TransactionType], null: false, description: 'Show all transactions basic details'
    def transactions
      Transaction.all
    end

  end
end
