# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
Manager.destroy_all
TeamLeader.destroy_all
WorkOrder.destroy_all

puts "Creating users..."
user = User.create!(email: "user@mail.com", password: "123456" )
admin = User.create!(email: "admin@mail.com", password: "123456" )
puts "Users created!! booyah"

puts "Creating manager..."
manager = Manager.create!(user: admin)
puts "Manager created!"

puts "Creating team leader...."
team_leader = TeamLeader.create!(user: user, manager: manager)
puts "Team leader created!!"

puts "Creating work order"

WorkOrder.create!(team_leader: team_leader)

puts "Work order created!!

puts "Users created: #{User.count}"
puts "Manager created: #{Manager.count}"
puts "Team leader created: #{TeamLeader.count}"
