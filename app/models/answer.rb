class Answer < ApplicationRecord
  belongs_to :question
  has_many :likes

  scope :liked, -> { joins(:likes) }

  validates :content, :question_id, presence: true

  def liked_by?(user)
    likes.where(user: user).present?
  end
end
