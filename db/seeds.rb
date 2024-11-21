# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# t = Tenant.create(name: "Demo Tenant")

# d1 = Department.create(name: "First Department", tenant: t)

# d2 = Department.create(name: "second Department", tenant: t)

# [{:first_name => "Mandar", :last_name => "Waghe", :email => "mandar@gmail.com"}, { :first_name => "Akshata", :last_name => "Waghe", :email => "akshata@gmail.com"}, { :first_name => "snehal", :last_name => "narkar", :email => "snehal@gmail.com"}].each do |u|
#     u = User.create(u)
#     user_tenant = UserTenant.create(tenant: t, user: u, role: "employee")
#     user_department = UserDepartment.create(department: d1, user: u, role: "employee")
# end

# [{ :first_name => "Swaraj", :last_name => "Chavan", :email => "swaraj@gmail.com"}, { :first_name => "Pranita", :last_name => "Gawade", :email => "pranita@gmail.com"}].each do |u|
#     u = User.create(u)
#     user_tenant = UserTenant.create(tenant: t, user: u, role: "employee")
#     user_department = UserDepartment.create(department: d2, user: u, role: "employee")
# end


[{ :user_id => "ceebb6a5-fa48-4a21-abc0-bf0dee211e20", :start_date => Time.zone.parse("2024-08-23 18:30"), :end_date => Time.zone.parse("2024-08-23 18:29") }].each do |h|
    Leaf.create(h)
end 