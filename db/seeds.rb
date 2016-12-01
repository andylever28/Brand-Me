# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


TwitterDatum.destroy_all
User.destroy_all

user_list = [
  ['Carmen', 'Barron', 'carmen@email.com', 'asdf', 'fishing', 'Ambassador', 'Carmen likes to fish!'],
  ['Nigell', 'King', 'nigell@email.com', 'asdf', 'foodie', 'Ambassador', 'Nigell likes to eat!'],
  ['Paul', 'Schoen', 'paul@email.com', 'asdf', 'surfing', 'Ambassador', 'Paul loves the water!'],
  ['Fishing Gear Inc', '(brand)', 'info@fishinggear.com', 'asdf', '(brand)', 'Brand', 'We need you to catch fish in our gear!'],
  ['Good Food Inc', '(brand)', 'info@goodfood.com', 'asdf', '(brand)', 'Brand', 'Eat our food & take lots of pics!']
]

user_list.each do |first_name, last_name, email, password, category, kind, summary|
  User.create(first_name: first_name, last_name: last_name, email: email, password: password, category: category, kind: kind, summary: summary)
end

  id_array = []

User.all.each do |user|
  id_array << user.id
end

twitter_info = [
  ['carmenb162', 'Sat Sep 27 08:03:40 +0000 2008', '32', '30', '16483758', 'hooptydoo', id_array[0]],
  ['1deringscholar', 'Tue Feb 01 05:02:37 +0000 2011', '211', '13633', '245653493', 'teeheehee', id_array[1]],
  ['pschoen325', 'Thu Feb 27 19:44:15 +0000 2014', '50', '5', '2369630722', 'blahblah', id_array[2]],
  ['ericjgreene917', 'Wed Jun 29 18:03:28 +0000 2011', '64', '4', '326300907', 'tweetytweet', id_array[3]],
  ['nastyahoppus', 'Wed Dec 29 22:46:16 +0000 2010', '9', '150', '231954366', 'lahdeedah', id_array[4]]
]

twitter_info.each do |screen_name, created_at, followers_count, statuses_count, id_str, last_status, user_id|
  TwitterDatum.create(screen_name: screen_name, created_at: created_at, followers_count: followers_count, statuses_count: statuses_count, id_str: id_str, last_status: last_status, user_id: user_id)

end
