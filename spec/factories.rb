FactoryGirl.define do
  factory :user do
    email     { Faker::Internet.email }
    password  { Faker::Internet.password }
    name      { Faker::Name.name }
    role      'user'

    trait :admin do
      role 'admin'
    end
  end
end