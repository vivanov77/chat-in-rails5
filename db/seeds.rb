# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

# http://stackoverflow.com/questions/4316940/create-a-devise-user-from-ruby-console
admin = User.find_or_create_by(email: "admin@example.com") { |u| u.password = "12345678"}
# admin.add_role :admin
# admin.first_name = "Admin"
# admin.confirm
admin.save!

user1 = User.find_or_create_by(email: "client1@example.com") { |u| u.password = "12345678"}
# user1.add_role :client
# user1.first_name = "John"
# admin.confirm
user1.save!

