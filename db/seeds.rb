# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_types = [AdminUser, ConsumerUser, MerchantUser]
roles      = %w[basic verified]

30.times do
  user_type = user_types.sample
  base_attr = {
    login_name: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    role:       roles.sample,
    active:     [true, false].sample
  }

  special_attrs = case user_type.name
  when 'AdminUser'
    { phone: Faker::PhoneNumber.cell_phone_in_e164 }
  when 'ConsumerUser'
    { email: Faker::Internet.email }
  when 'MerchantUser'
    { company_name: Faker::Company.name }
  end

  user = user_type.create!(base_attr.merge(special_attrs))

  rand(3..20).times do
    user.transactions.create!(
      unique_id: SecureRandom.uuid,
      amount:    Faker::Number.number(digits: 4),
      currency:  %w[EUR USD BGN].sample,
      status:    %i[approved approved declined].sample
    )
  end
end
