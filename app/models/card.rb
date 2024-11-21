class Card < ApplicationRecord
  belongs_to :column
  belongs_to :user

  scope :ordered, -> { order(created_at: :desc)}
end
