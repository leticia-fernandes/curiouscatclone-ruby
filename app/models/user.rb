class User < ApplicationRecord
  has_many :submitted_questions, class_name: "Question", foreign_key: "user_sender_id"
  has_many :received_questions, class_name: "Question", foreign_key: "user_addressee_id"
  has_many :likes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, :name, presence: true
  validates :username, uniqueness: true
end
