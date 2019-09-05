# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
User.destroy_all
Manager.destroy_all
TeamLeader.destroy_all
WorkOrder.destroy_all
Category.destroy_all
# Status.destroy_all


puts "Creating CATEGOIRES Work Orders..."
categories = ["Category1", "Category2", "Category3", "Category4", "Category5"]
categories.each do |categorie|
  Category.create(category_name: categorie)
end

# puts "Creating STATUS Work Orders..."
# statuses = ["Realizado", "Não foi possível finalizar"]
# statuses.each do |status|
#   Status.create(status_name: status)
# end

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
WorkOrder.create!(team_leader: team_leader, name: "job1", priority: 1, status: 2, due_date: Date.parse('30-12-2019'))
WorkOrder.create!(team_leader: team_leader2, name: "job2", priority: 1, status: 3, due_date: Date.parse('20-11-2019'))
WorkOrder.create!(team_leader: team_leader, name: "job3", priority: 3, status: 1, due_date: Date.parse('20-11-2019'))
WorkOrder.create!(team_leader: team_leader, name: "job4", priority: 2, status: 2, due_date: Date.parse('20-11-2019'))
WorkOrder.create!(team_leader: team_leader2, name: "job5", priority: 3, status: 3, due_date: Date.parse('30-11-2019'))
WorkOrder.create!(team_leader: team_leader, name: "job6", priority: 1, status: 2, due_date: Date.parse('30-11-2019'))
WorkOrder.create!(team_leader: team_leader2, name: "job7", priority: 2, status: 1, due_date: Date.parse('30-11-2019'))
puts "Work order created!!"

puts "Users created: #{User.count}"
puts "Manager created: #{Manager.count}"
puts "Team leader created: #{TeamLeader.count}"
puts "Wor Order created: #{WorkOrder.count}"
