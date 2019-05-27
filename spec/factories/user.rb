FactoryBot.define do
  factory :user do
    name {'John'}
    email { 'john@mail.com' }
    username { 'john.doe' }
    password { '123456' }
  end
end
