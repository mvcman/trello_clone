class Department < ApplicationRecord
  belongs_to :tenant 
  has_many :user_departments 
  has_many :users, through: :user_departments
end
