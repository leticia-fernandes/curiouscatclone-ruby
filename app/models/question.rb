class Question < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: 'user_sender_id'
  belongs_to :addressee, class_name: "User", foreign_key: 'user_addressee_id'
  has_many :answers
end
