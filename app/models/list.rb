class List < ApplicationRecord
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :priolity
end
