# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
User.destroy_all
Manager.destroy_all
TeamLeader.destroy_all
WorkOrder.destroy_all

categories = ["Vistoria", "Tapa buraco", "Encanamento de Gás", "Encanamento de Água", "Fiação elétrica"]
categories.each do |categorie|
  Category.create(name: categorie)
end

puts "Creating users..."
user = User.create!(name:"nome-user1", email: "user@mail.com", password: "123456" )
user2 = User.create!(name:"nome-user2", email: "user2@mail.com", password: "123456" )
admin = User.create!(name:"nome-admin1", email: "admin@mail.com", password: "123456" )
admin2 = User.create!(name:"nome-admin2", email: "admin2@mail.com", password: "123456" )
puts "Users created!! booyah"

puts "Creating manager..."
manager = Manager.create!(user: admin)
manager2 = Manager.create!(user: admin2)
puts "Manager created!"

puts "Creating team leader...."
team_leader = TeamLeader.create!(user: user, manager: manager, team_name: "Time Moloko")
team_leader2 = TeamLeader.create!(user: user2, manager: manager2, team_name: "Time Pobressito")
puts "Team leader created!!"

puts "Creating work order"

WorkOrder.create!(team_leader: team_leader, name: "job1")
WorkOrder.create!(team_leader: team_leader2, name: "job2")

puts "Work order created!!"

puts "Users created: #{User.count}"
puts "Manager created: #{Manager.count}"
puts "Team leader created: #{TeamLeader.count}"
