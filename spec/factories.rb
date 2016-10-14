FactoryGirl.define do
  factory :user do
    email     { Faker::Internet.email }
    password  { Faker::Internet.password }
    name      { Faker::Name.name }

    trait :admin do
      role 'admin'
    end
  end
end