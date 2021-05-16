# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


movements = [{name:"push-ups", category:"chest"},{name:"crunches", category:"abdomin"}]

movements.each do |movement|
    Movement.create(movement)
end

users = [{name:"atef", password:"123123"},{name:"hammo", password:"123123"}]

users.each do |user|
    User.create(user)
end

