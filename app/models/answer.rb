class Answer < ApplicationRecord
  belongs_to :question
  has_many :likes

  validates :content, :question, presence: true
end
