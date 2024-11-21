class AttendanceStatus < ApplicationRecord
    has_many :attendances
    enum :theme, %w[ WFH WFO REMOTE ], default: 0
end
