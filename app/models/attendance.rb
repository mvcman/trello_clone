class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :attendance_status
end
