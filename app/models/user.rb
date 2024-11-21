class User < ApplicationRecord
    has_many :user_tenants 
    has_many :tenants, through: :user_tenants

    has_many :user_departments 
    has_many :departments, through: :user_departments

    has_many :leafs 
    has_many :attendances 

    has_many :cards 

    def full_name
        first_name + " " + last_name
    end 
end
