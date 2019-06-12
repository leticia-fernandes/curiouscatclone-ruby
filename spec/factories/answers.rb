FactoryBot.define do
  factory :answer do
    content { "My answer" }
    association :question, factory: :question, strategy: :create
  end
end
