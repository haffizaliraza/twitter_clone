# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Create sample users in a loop
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.unique.user_name
  )
end

# Create sample tweets and comments in a loop
users = User.all

500.times do
  user = users.sample
  tweet = Tweet.create!(body: Faker::Lorem.sentence, user: user)
  puts("tweet:", tweet.body, user.email)

  comment = Comment.create!(
    user: users.sample,
    tweet: tweet,
    body: Faker::Lorem.sentence
  )
  puts("comment:", comment.body)
end