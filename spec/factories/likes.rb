FactoryBot.define do
  factory :like do
    answer
    association :user, factory: :random_user, strategy: :create
  end
end
