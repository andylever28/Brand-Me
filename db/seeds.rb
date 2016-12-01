# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


TwitterDatum.delete_all
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

  id_array = []

User.all.each do |user|
  id_array << user.id
end

twitter_info = [
  ["carmenb162", "Fri Jun 21 16:02:21 +0000 2013", "50", "55", "34234", "hi!", id_array[0]],
  ["potus", "Fri Jun 21 16:02:21 +0000 2013", "50", "55", "34234", "hi!", id_array[1]],
  ["poetus", "Fri Jun 21 16:02:21 +0000 2013", "50", "55", "34234", "hi!", id_array[2]],
  ["wynncode", "Fri Jun 21 16:02:21 +0000 2013", "50", "55", "34234", "hi!", id_array[3]]
]

twitter_info.each do |screen_name, created_at, followers_count, statuses_count, id_str, last_status, user_id|
  TwitterDatum.create(screen_name: screen_name, created_at: created_at, followers_count: followers_count, statuses_count: statuses_count, id_str: id_str, last_status: last_status, user_id: user_id)

end
