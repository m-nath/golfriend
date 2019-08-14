# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seed started.. for users and events"

Reservation.delete_all if Rails.env.development?
Event.delete_all if Rails.env.development?
User.delete_all if Rails.env.development?

nath = User.create!(
  email: "m.nath1105@gmail.com",
  password: "123123",
  first_name: "Nath",
  last_name: "M",
  admin: true
  )

christee = User.create!(
  email: "christee.song@gmail.com",
  password: "123123",
  first_name: "Christee",
  last_name: "Song",
  admin: true
  )

shohei = User.create!(
  email: "shohei@gmail.com",
  password: "123123",
  first_name: "Shohei",
  last_name: "Okubo"
  )

huishu = User.create!(
  email: "huishu@gmail.com",
  password: "123123",
  first_name: "Huishu",
  last_name: "Jia"
  )

10.times do
  User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "123123")
end

puts "added #{User.count} users."

User.all.each do |user|
  rand(1..3).times do
    Event.create!(
      name: Faker::TvShows::GameOfThrones.character + "Golf Club",
      description: Faker::TvShows::GameOfThrones.quote,
      photo: "https://source.unsplash.com/1000x700/?golfer",
      date: Faker::Date.forward(days: 100),
      location: ["17-10 Sarugakucho, Shibuya City, Tokyo 150-0033", "5 Chome-4-3 Megurohoncho, Meguro City, Tokyo 152-0002","〒153-0051 Tokyo, Meguro City, Kamimeguro, 1 Chome−23−1", "〒106-0031 Tokyo, Minato City, Nishiazabu, 1 Chome−15−4","1 Chome-24-2 Meguro, Meguro City, Tokyo 153-0063","5 Chome-12 Shirokanedai, Minato City, Tokyo 108-0071"].sample,
      max_participants:rand(1..7),
      user: user
     )
  end
  rand(1..3).times do
    Reservation.create!(
      user: user,
      event: Event.all.sample
      )
  end
end
puts "added #{Event.count} events."

puts "Seed is done!"
