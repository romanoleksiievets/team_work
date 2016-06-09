# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This is default user
Organization.create(owner_id: 1, name: 'First Organization', domain: "first")
User.create(email: 'fedorniakl@gmail.com', password: 'FirstSA10', name: 'Lyubomyr', system_admin: true)
