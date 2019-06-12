FactoryBot.define do
  factory :like do
    association :answer, factory: :answer, strategy: :create
    association :user, factory: :random_user, strategy: :create
  end
end
