FactoryBot.define do
  factory :answer do
    answer { "My answer" }
    association :question, factory: :question, strategy: :create
  end
end
