# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all

user_list = [
  ["Bobby", "Bobson", "bob@email.com","asdf", "fishing", "Ambassador", "Bob likes to fish!"],
  ["Suzy", "Snowflake", "suzy@email.com", "asdf", "foodie", "Ambassador", "Suzy likes to eat!"],
  ["Richard", "Richardson", "rich@email.com", "asdf", "surfing", "Ambassador", "Rich loves the water!"],
  ["Fishing Gear Inc", "a", "info@fishinggear.com", "asdf", "b", "Brand", "We need you to catch fish in our gear!"]
]

user_list.each do |first_name, last_name, email, password, category, kind, summary|
  User.create(first_name: first_name, last_name: last_name, email: email, password: password, category: category, kind: kind, summary: summary)
end
