class Task < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 5 }
end
