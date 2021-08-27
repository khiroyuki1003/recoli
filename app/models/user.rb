class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, length: { maximum: 20, message:"is invalid. Please enter at least 20 characters"}
    validates :birth_date
  end

  validates :password, format: {with: /\A[a-zA-Z0-9]+\z/, message:"is invalid. Half-width alphanumeric only."}
  validates :precious_word, length: { maximum: 100, message:"is invalid. Please enter at least 100 characters"}
end
