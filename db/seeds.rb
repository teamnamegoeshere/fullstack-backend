# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
test_user = User.create({first_name: "Test", last_name: "User", email: "test@test.com",
    username: "test123", password: "Password1", password_confirmation: "Password1",
    date_of_birth: "2000-10-01"})
