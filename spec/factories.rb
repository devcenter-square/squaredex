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

  factory :karma_request do
    karma       { Faker::Number.between(1, 5) }
    reason      { Faker::Lorem.sentence }
    project_id  { Faker::Number.digit }
    from        { Faker::Name.name }
    to          { Faker::Name.name }
  end
end