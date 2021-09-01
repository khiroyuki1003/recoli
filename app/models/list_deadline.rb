class ListDeadline < ApplicationRecord
  belongs_to :list 

  with_options presence: true do
    validates :list_deadline_date
    validates :list_deadline_time
  end
  
end
  