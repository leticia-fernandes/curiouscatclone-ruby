FactoryBot.define do
  factory :question do
    question { "MyText" }
    user_sender_id { 1 }
    user_addressee_id { 1 }
    anonymous { false }
  end
end
