

10.times do
    User.create(name: Faker::FunnyName.unique.name, email: Faker::Internet.unique.email, password: Faker::Internet.unique.password)
    Book.create(title: Faker::Book.title, author: Faker::Book.author, user_id: Faker::Number.digit)
end