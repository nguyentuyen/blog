namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_entries
    make_relationships
    make_comments
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@railstutorial.org",
                       password: "foobar",
                       password_confirmation: "foobar",
                       admin: true
                       )
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_entries
  users = User.all(limit: 6)
  50.times do
    title = Faker::Lorem.sentence(5)
    body = Faker::Lorem.sentence(7)
    users.each { |user| user.entries.create!(title: title, body: body) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

def make_comments
  entries = Entry.all(limit: 6)
  50.times do
    name = Faker::Name.name
    comment = Faker::Lorem.sentence(7)
    entries.each { |entry| entry.comments.create!(name: name, comment: comment) }
  end
end