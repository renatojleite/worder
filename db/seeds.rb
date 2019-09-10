# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
User.destroy_all
Manager.destroy_all
TeamLeader.destroy_all
WorkOrder.destroy_all
Category.destroy_all
# Status.destroy_all


puts "Creating CATEGOIRES Work Orders..."
categories = ["Pré-Visita", "Manutenção", "Operação Técnica", "Category4", "Category5"]
categories.each do |categorie|
  Category.create(category_name: categorie)
end

# puts "Creating STATUS Work Orders..."
# statuses = ["Realizado", "Não foi possível finalizar"]
# statuses.each do |status|
#   Status.create(status_name: status)
# end

puts "Creating users..."
user = User.create!(name:"Eng Carolin S.", email: "user@mail.com", password: "123456" )
user2 = User.create!(name:"Técnico Thomas M.", email: "user2@mail.com", password: "123456" )
user3 = User.create!(name:"Tecnico Carlos F.", email: "user3@mail.com", password: "123456" )
user4 = User.create!(name:"Técnico Renato L.", email: "user4@mail.com", password: "123456" )
user5 = User.create!(name:"Eng Gabriela S.", email: "user5@mail.com", password: "123456" )
admin = User.create!(name:"Gestor Daniel L. Silva", email: "admin@mail.com", password: "123456" )

puts "Users created!! booyah"

puts "Creating manager..."
manager = Manager.create!(user: admin)
puts "Manager created!"

puts "Creating team leader...."
team_leader = TeamLeader.create!(user: user, manager: manager, team_name: "Equipe Manutenção-A01")
team_leader2 = TeamLeader.create!(user: user2, manager: manager, team_name: "Equipe Técnica-A02")
team_leader3 = TeamLeader.create!(user: user3, manager: manager, team_name: "Equipe Engenharia-B03")
team_leader4 = TeamLeader.create!(user: user4, manager: manager, team_name: "Equipe Acompanhamento-C04")
team_leader5 = TeamLeader.create!(user: user5, manager: manager, team_name: "Equipe Operação-D05")

puts "Team leader created!!"

descricao = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam metus purus, hendrerit sit amet porttitor at, ornare nec ligula. Morbi nec pulvinar nulla. Aliquam non neque rutrum, pharetra purus sed, feugiat mi. Mauris non dignissim magna, vel interdum diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce ex neque, hendrerit nec pulvinar sed, hendrerit ut orci. Nam urna sem, laoreet vel metus non, rhoncus dapibus odio. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse sed vulputate nunc. Duis dictum ante quis tortor dictum, sed placerat turpis pellentesque. Curabitur efficitur arcu et neque tempus scelerisque. Phasellus sagittis gravida venenatis. Integer quis dignissim enim. Nunc sed pretium orci, ut mattis tortor."

puts "Creating work order"
WorkOrder.create!(team_leader: team_leader, name: "job1", priority: 1, status: 2, due_date: DateTime.new(2019,9,10,4,5,6), address: "Avenida Brigadeiro Faria Lima, 3400, sao paulo", description: descricao)
WorkOrder.create!(team_leader: team_leader2, name: "job2", priority: 1, status: 3, due_date: DateTime.new(2019,9,11,4,5,6), address: "Avenida Chucri Zaidan, 900, sao paulo", description: descricao)
WorkOrder.create!(team_leader: team_leader, name: "job3", priority: 3, status: 1, due_date: DateTime.new(2019,9,12,4,5,6), address: "Alameda Joaquim Eugenio de Lima, 844, sao paulo", description: descricao)
WorkOrder.create!(team_leader: team_leader, name: "job4", priority: 2, status: 2, due_date: DateTime.new(2019,9,13,10,5,6), address: "Rua Capote Valente, 222, sao paulo", description: descricao)
WorkOrder.create!(team_leader: team_leader2, name: "job5", priority: 3, status: 3, due_date: DateTime.new(2019,9,13,17,5,6), address: "Avenida paulista, 2000, sao paulo", description: descricao)
WorkOrder.create!(team_leader: team_leader, name: "job6", priority: 1, status: 2, due_date: DateTime.new(2019,9,12,4,5,6), address: "Rua Verbo Divino, 1784, sao paulo", description: descricao)
WorkOrder.create!(team_leader: team_leader2, name: "job7", priority: 2, status: 1, due_date: DateTime.new(2019,9,14,9,5,6), address: "Rua da Cantareira, 315, sao paulo", description: descricao)
puts "Work order created!!"

puts "Users created: #{User.count}"
puts "Manager created: #{Manager.count}"
puts "Team leader created: #{TeamLeader.count}"
puts "Work Order created: #{WorkOrder.count}"
