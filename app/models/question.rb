class Question < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :addressee, class_name: 'User'
  has_one :answer

  scope :answered,   -> { joins(:answer) }
  scope :unanswered, -> { left_outer_joins(:answer).where(answers: { id: nil }) }
  scope :anonymous,  -> { where(anonymous: true) }

  validates :content, :sender_id, :addressee_id, presence: true
end
