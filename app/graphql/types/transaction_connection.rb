module Types
  class TransactionConnection < BaseConnection

    edge_type(TransactionEdge)

    field :total_count, Integer, null: false
    def total_count
      object.nodes.first.user.transactions.count
    end

  end
end
