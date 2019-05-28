class Answer < ApplicationRecord
  belongs_to :question
  has_many :likes

  validates :content, presence: true
end
