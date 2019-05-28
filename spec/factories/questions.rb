FactoryBot.define do
  factory :question do
    content { "My question" }
    association :sender, factory: :random_user, strategy: :create
    association :addressee, factory: :random_user, strategy: :create
    anonymous { false }
  end

end
