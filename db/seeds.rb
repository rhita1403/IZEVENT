# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."

Review.destroy_all
Task.destroy_all
Participation.destroy_all
Event.destroy_all
User.destroy_all

puts "Creating seeds..."

william = User.create(first_name: 'william', last_name: 'varsovie', email: 'william.varsovie@gmail.com', password: '123456', phone_number: '0123456')
rhita = User.create(first_name: 'rhita', last_name: 'lamdouar', email: 'rhita.lamdouar@hotmail.com', password: '123456', phone_number: '456789')
manger_des_haribos = Event.create(title: "Haribo", location: "7 Boundary St, London E2 7JE", date: "2023 November 27", description: "on va grossir", user: william)
manger_des_cookies = Event.create(title: "Cookie", location: "7 Boundary St, London E2 7JE", date: "2023 November 27", description: "on va grossir", user: rhita)

puts "seeds created"
