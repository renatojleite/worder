# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.destroy_all

puts "Creating Users...."
user = User.create!(email: "user@mail.com", password: "123456" )
puts "Users created!.."

admin = User.create!(email: "admin@mail.com", password: "123456" )

puts "Creating Manager...."
manager = Manager.create!(user: admin)
puts "Manager created!.."


puts "Creating team leader ...."
team_leader = TeamLeader.create! ( user: user, manager: manager )
puts "Team leader created!.."



puts "Users created: #{User.count}"
puts "Manager created: #{Manager.count}"
puts "Team leader created: #{TeamLeader.count}"
