FactoryBot.define do
  factory :user do
    name {'John'}
    email { 'john@mail.com' }
    username { 'john.doe' }
    password { '123456' }
  end
  factory :random_user, class: 'User' do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    username { Faker::Internet.unique.username }
    password { Faker::Internet.password(6) }
  end
end
