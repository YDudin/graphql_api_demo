module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # User related queries
    field :just_users, [UserType], null: false, description: 'Show all users basic details'
    def just_users
      User.all
    end

    field :users, [UserInterface], null: true, description: 'Show all users details' do
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

    field :admin_users, [AdminUserType], null: true, description: 'Show all admin users details'
    def admin_users
      AdminUser.all
    end

    field :consumer_users, [ConsumerUserType], null: true, description: 'Show all consumer users details'
    def consumer_users
      ConsumerUser.all
    end

    field :merchant_users, [MerchantUserType], null: true, description: 'Show all merchant users details'
    def merchant_users
      MerchantUser.all
    end

    field :union_users, [UserUnion], null: true, description: 'Show all users via union'
    def union_users
      User.all
    end

    # Transaction related queries
    field :transactions, [TransactionType], null: true, description: 'Show all transactions basic details'
    def transactions
      Transaction.all
    end

  end
end
