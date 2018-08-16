# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Quest.delete_all

10.times do 
    quest = Quest.create({ question: Faker::Lorem.sentence, answer: "True answer", first: "First answer", second: "Second answer", third: "Third answer" })
end

puts "Quest was seeded"

User.delete_all

user = User.create({
    name: "lupa",
    email: "lupa@mail.ru",
    password_digest: BCrypt::Password.create("123456")
})

user = User.create({
    name: "pupa",
    email: "pupa@mail.ru",
    password_digest: BCrypt::Password.create("123456"),
    ready: true
})

user = User.create({
    name: "lion",
    email: "lion@mail.com",
    password_digest: BCrypt::Password.create("123456"),
    ready: true
})

user = User.create({
    name: "abbadon",
    email: "abbadon@mail.com",
    password_digest: BCrypt::Password.create("123456"),
    ready: true
})

user = User.create({
    name: "crystal_maiden",
    email: "crystalmaiden@mail.ru",
    password_digest: BCrypt::Password.create("123456")
})

puts "Users was seeded"