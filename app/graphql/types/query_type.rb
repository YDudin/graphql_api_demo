module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # User related queries
    field :just_users, [UserType], null: false, description: 'Show all users basic details'
    def just_users
      User.all
    end

    field :users, [UserInterface], null: false, description: 'Show all users details' do
      argument :first_name, String,
               required:    false,
               description: 'Filter records by user first name'
      argument :role,       RoleEnum,
               required:    false,
               description: 'Filter records by user first name'
    end
    def users(first_name: nil, role: nil)
      filters = { first_name: first_name, role: role }.select { |k,v| v.present? }
      User.where(filters)
    end

    field :admin_users, [AdminUserType], null: false, description: 'Show all admin users details'
    def admin_users
      AdminUser.all
    end

    field :consumer_users, [ConsumerUserType], null: false, description: 'Show all consumer users details'
    def consumer_users
      ConsumerUser.all
    end

    field :merchant_users, [MerchantUserType], null: false, description: 'Show all merchant users details'
    def merchant_users
      MerchantUser.all
    end

    field :union_users, [UserUnion], null: false, description: 'Show all users via union'
    def union_users
      User.all
    end

    # Transaction related queries
    field :transactions, [TransactionType], null: false, description: 'Show all transactions basic details'
    def transactions
      Transaction.all
    end

  end
end
