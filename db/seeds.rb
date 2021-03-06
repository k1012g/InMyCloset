# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env == "development"
  10.times do |i|
    User.create!(name: "Test#{i + 1}", email: "test#{i + 1}@example.com", password: "123456", password_confirmation: "123456")
  end
end
Category.create(category: "tops")
Category.create(category: "outer")
Category.create(category: "dress")
Category.create(category: "skirt")
Category.create(category: "pants")
Category.create(category: "setup")
Category.create(category: "formal")
Category.create(category: "sneaker")
Category.create(category: "shoes")
Category.create(category: "boots")
Category.create(category: "hat/cap")
Category.create(category: "accessory")
Category.create(category: "bag")