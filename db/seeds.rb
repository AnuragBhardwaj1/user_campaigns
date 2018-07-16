# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  expert = User.new(email: 'spree@example.com', password: '123456')
  expert.profession = 'test profession'
  expert.service = "test service"
  user.expert!
  expert.save


  novice = User.new(email: 'spree@example.com', password: '123456')
  novice.save
