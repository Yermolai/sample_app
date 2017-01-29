# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


##  rails db:migrate:reset
##  rails db:seed

User.create!(name:  "Admin ",
    email: "admin@admin.com",
    password:              "123456",
    password_confirmation: "123456",
    admin:  true,
    activated: true,
    activated_at: Time.zone.now)


User.create!(name:  "John Walk",
    email: "q@q.q",
    password:              "123456",
    password_confirmation: "123456",
    admin:  true,
    activated: true,
    activated_at: Time.zone.now)


99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@goodforyou.org"
  password = "password"
  User.create!(name:  name,
      email: email,
      password:              password,
      password_confirmation: password,
      activated: true,
      activated_at: Time.zone.now)
end


users = User.order(:created_at).take(6)
50.times do
  content = Faker::ChuckNorris.fact[0..139]
  users.each { |user| user.microposts.create!(content: content) }
end

(4..10).to_a.each do |user_id|
                    User.find_by_id(user_id).microposts.create!(content: "An old man said: " + Faker::StarWars.quote)
end

User.find_by_email("q@q.q").microposts.create!(content: "волков бояться - никуда не идти")

# Following relationships
users = User.all
mainusers=[users.first, users.second]
mainusers.each do |user|
  following = users[5..50]
  followers = users[4..40]
  following.each { |followed| user.follow(followed) }
  followers.each { |follower| follower.follow(user) }
end