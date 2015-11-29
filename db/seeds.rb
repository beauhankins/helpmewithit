# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.find_or_initialize_by(email: 'admin@helpmewithit.org.au').update(password: ENV['DEFAULT_ADMIN_PASSWORD'], approved: true, admin: true)


Post.create!(title: 'test task_HERE!', category: 'cooking', contact: 'mysteryman', content: 'blah', latitude: '-27.447420', longitude: '153.035416', address: 'Bowen Hills', created_at: Time.now)
Post.create!(title: 'test task North Lakes', category: 'cooking', contact: 'superman', content: 'blah', latitude: '-27.228159', longitude: '153.002367', address: 'North Lakes', created_at: Time.now )

