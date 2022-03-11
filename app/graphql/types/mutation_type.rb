module Types
  class MutationType < Types::BaseObject

    field :create_admin_user,
          mutation:    Mutations::CreateAdminUser,
          description: 'Create admin user'

  end
end
