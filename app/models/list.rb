class List < ApplicationRecord
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :priolity

  validates :list_title, presence: true, length: {
    maximum: 100, message:"is invalid. Please enter at least 100 characters"
   }
end
 