FactoryGirl.define do
  factory :admin do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end
  factory :super_admin, class: Admin do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    super_admin true
  end
end
