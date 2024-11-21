class Tenant < ApplicationRecord
    has_many :user_tenants
    has_many :users, through: :user_tenants 

    has_many :departments
end
