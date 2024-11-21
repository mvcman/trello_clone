class Column < ApplicationRecord
    belongs_to :project
    has_many :cards, dependent: :destroy
    enum :color, %w[gray zinc stone rose yellow orange green cyan purple].index_by(&:itself), suffix: true, default: :blue

    scope :ordered, -> { order(created_at: :asc)}
end
