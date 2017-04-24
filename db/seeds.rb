User.create!(player:  "Angie",
             email: "me@home.com",
             password:              "foobar",
             password_confirmation: "foobar",
             status: "admin")
             
             
99.times do |n|
  player  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(player:  player,
               email: email,
               password:              password,
               password_confirmation: password)
              
end
