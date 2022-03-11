module Types
  class AdminUserInput < BaseInputObject

    argument :login_name,   String,          required: true, description: '`login name` property of a user'
    argument :first_name,   String,          required: true, description: '`first name` property of a user'
    argument :last_name,    String,          required: true, description: '`last_name` property of a user'
    argument :role,         Types::RoleEnum, required: true, description: '`role` property of a user'
    argument :phone,        String,          required: true, description: 'Admin user phone'

  end
end
