# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create!(name:  "Example User",
    email: "example@railstutorial.org",
    password:              "foobar",
    password_confirmation: "foobar",
    admin:  true)

User.create!(name:  "q",
    email: "q@q.q",
    password:              "123456",
    password_confirmation: "123456",
    admin:  true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
      email: email,
      password:              password,
      password_confirmation: password)
end


users = User.order(:created_at).take(6)
50.times do
  content = Faker::ChuckNorris.fact[1..139]
  users.each { |user| user.microposts.create!(content: content) }
end

(1..5).to_a.each do |user_id|
                    User.find_by_id(user_id).microposts.create!(content: "BITCH: " + Faker::StarWars.quote)
                 end
User.find_by_name("q").microposts.create!(content: "волков бояться - нахуй идти")

# Following relationships
users = User.all
mainusers=[users.first, users.second]
mainusers.each do |user|
  following = users[5..50]
  followers = users[4..40]
  following.each { |followed| user.follow(followed) }
  followers.each { |follower| follower.follow(user) }
end