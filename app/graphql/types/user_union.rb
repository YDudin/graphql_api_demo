# frozen_string_literal: true

module Types

  # Describes **User** type model
  class UserUnion < Types::BaseUnion

    # description "Objects which may be commented on"
    possible_types Types::AdminUserType, Types::ConsumerUserType, Types::MerchantUserType

    # # Optional: if this method is defined, it will override `Schema.resolve_type`
    # def self.resolve_type(object, context)
    #   return AdminUserType    if object.is_a?(AdminUser)
    #   return ConsumerUserType if object.is_a?(ConsumerUser)
    #   return MerchantUserType if object.is_a?(MerchantUser)
    # end

  end

end
