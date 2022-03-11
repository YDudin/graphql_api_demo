module Mutations
  class CreateAdminUser < BaseMutation

    argument :input,
              Types::AdminUserInput,
              required:    true,
              description: <<~DESCRIPTION
                User specific params for creation.
              DESCRIPTION

    field :admin_user,  Types::AdminUserType, null: false, description: 'Created admin user'

    def resolve(input:)
      external_params = input.to_h.slice(:login_name, :first_name, :last_name, :role, :phone)
      admin_user = AdminUser.create(active: true, **external_params)

      {
        admin_user: admin_user
      }
    end

  end
end
