# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Thomas', email: 'thomas@example.com', password: 'password1', blurb: 'example blurb')
User.create(name: 'Sam', email: 'sam@example.com', password: 'password2', blurb: 'example blurb')
User.create(name: 'Sarah', email: 'sarah@example.com', password: 'password3', blurb: 'example blurb')
User.create(name: 'Geoff', email: 'geoff@example.com', password: 'password4', blurb: 'example blurb')
User.create(name: 'James', email: 'james@example.com', password: 'password5', blurb: 'example blurb')

Splatt.create(body: 'Hello World', user_id: [0])
Splatt.create(body: 'Something', user_id: [1])
Splatt.create(body: 'Hurrah!!', user_id: [2])
Splatt.create(body: 'Groovy!', user_id: [3])
Splatt.create(body: 'Blah', user_id: [4]) 