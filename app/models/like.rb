class Like < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  has_one :addressee, through: :answer

  validates :answer_id, :user_id, presence: true
end
