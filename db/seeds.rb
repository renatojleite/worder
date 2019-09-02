# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "Creating Users...."
User.create!(email:"renatoMoloko@molokito.com", password: "123123" )
User.create!(email: "contato1@banana.com", password: "123456" )
User.create!(email: "contato2@banana.com", password: "123456" )
User.create!(email: "contato3@banana.com", password: "123456" )
User.create!(email: "contato4@banana.com", password: "123456" )
