# frozen_string_literal: true

module Types

  # Common user fields
  module UserInterface

    include BaseInterface

    description 'Common data for all users'

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

    # def self.resolve_type(object, context)
    #   return AdminUserType    if object.is_a?(AdminUser)
    #   return ConsumerUserType if object.is_a?(ConsumerUser)
    #   return MerchantUserType if object.is_a?(MerchantUser)
    # end

  end

end
