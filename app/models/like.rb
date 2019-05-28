class Like < ApplicationRecord
  belongs_to :answer
  belongs_to :user

  validates :answer_id, :user_id, presence: true
end
