class Answer < ApplicationRecord
  belongs_to :question
  has_many :likes
  has_one :addressee, through: :question

  scope :liked, -> { joins(:likes) }

  validates :content, :question_id, presence: true

  def liked_by?(user)
    likes.where(user: user).present?
  end

  def like_from(user)
    likes.find_by(user: user)
  end
end
