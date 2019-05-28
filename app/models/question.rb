class Question < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :addressee, class_name: "User"
  has_many :answers

  validates :content, :sender_id, :addressee_id, presence: true
end
