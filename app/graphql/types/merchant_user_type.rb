# frozen_string_literal: true

module Types

  # Describes **MerchantUser** type model
  class MerchantUserType < Types::BaseObject

    implements UserInterface

    field :company_name, String, null: false, description: 'Merchant company name'

  end

end
