class Like < ApplicationRecord
  belongs_to :answer
  belongs_to :user

  validates :answer, :user, presence: true
end
