class Answer < ApplicationRecord
  belongs_to :question
  has_many :likes

  validates :content, :question_id, presence: true
end
