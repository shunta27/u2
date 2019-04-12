FactoryBot.define do
  pass = Faker::Internet.password(8)

  factory :base_user, class: User do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { pass }
    password_confirmation { pass }
    confirmed_at { Time.now }
  end
end