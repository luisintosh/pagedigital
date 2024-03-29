# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Rails.env.development?
  # Create default user
  user = User.create(email: 'test@test', password: '123456')
  # Create default pages
  ['test'].each { |slug| user.pages.create( slug: )}
  AdminUser.create!(email: 'test@test', password: '123456', password_confirmation: '123456')
end
