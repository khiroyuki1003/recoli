class Category < ApplicationRecord
  belongs_to :profile

  validates :category_name, presence: true, length: {
    maximum: 20, message:"is invalid. Please enter at least 20 characters"
   }
end
