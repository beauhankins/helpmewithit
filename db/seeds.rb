# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.find_or_initialize_by(email: 'admin@helpmewithit.org.au').update(password: ENV['DEFAULT_ADMIN_PASSWORD'], approved: true, admin: true)

Post.create(title: 'Resume writing', category: 'Admin', description: 'I’d like help with reviewing my CV.', explanation: 'I desperately need work and I’m not getting interviews.', location: 'Goodna')

Post.create(title: 'Grocery shopping', category: 'Shopping', description: 'I’d like help to do my shopping any day next week.', explanation: 'I’d like help with reviewing my CV.', location: 'Carole Park')

Post.create(title: 'Fix broken bike', category: 'Transport', description: 'I’d like help to repair my push bike which has a flat and stiff breaks.', explanation: 'I have a new tube but can’t work it out and I need it to get to my new job.', location: 'Flinders View')

Post.create(title: 'Built new cabinet', category: 'Handyman', description: 'I’d like help to put together a new cabinet I bought from IKEA.', explanation: 'I just moved into rental accommodation and I don’t have much furniture. I can’t lift things at the moment.', location: 'Carole Park')

Post.create(title: 'Cooking a few meals', category: 'Food', description: 'I’d like help from someone who can cook my family of 3 a few meals please.', explanation: 'Our house was flooded in the x flood and this would take some pressure off for a few nights.', location: 'Redbank')

Post.create(title: 'A short walk and talk', category: 'Caring', description: 'I’d like help from someone to walk with me to the library please.', explanation: 'I’m a widow with no family nearby. I can walk but would feel safe walking with someone and would like some company.', location: 'Rosewood')

Post.create(title: 'Letter about Body Corporate issue', category: 'Admin', description: 'I’d like help to understand some correspondence about issues in my building.', explanation: 'This is my first time in a unit and I am very confused about what my options are.', location: 'Tivoli')

Post.create(title: 'Second hand fridge', category: 'Shopping', description: 'I’d like help to find a second hand fridge online.', explanation: 'I can’t afford a new fridge and I need one before Christmas. I’m not great on the computer and not sure where to start.', location: 'Bellbird Park')

Post.create(title: 'Lift to the Doctor', category: 'Transport', description: 'I’d like a lift to the Doctor – not far from my house.', explanation: 'I can’t drive at the moment and my family is away for a month.', location: 'Flinders View')

Post.create(title: 'New ramp to laundry', category: 'Handyman', description: 'I’d like help to build a ramp from my kitchen to the laundry. A wooden ramp would be fine.', explanation: 'I can’t get out of the laundry by myself and I’m not handy enough to make it.', location: 'Carole Park')

Post.create(title: 'Translate a document', category: 'Languages', description: 'I’d like help to translate a document from English to German.', explanation: 'I need to respond to important correspondence and my English is poor. It’s important information linked to my VISA.', location: 'Redbank')

Post.create(title: 'Set up new computer', category: 'Technology', description: 'I’d like help to set up my new computer.', explanation: 'I have been using a computer in my library but now have one of my own. I’ve started the set-up but stuck.', location: 'Rosewood')
