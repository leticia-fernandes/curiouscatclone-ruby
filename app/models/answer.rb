class Answer < ApplicationRecord
  belongs_to :question
  has_many :likes

  validates :answer, :question, presence: true
end
