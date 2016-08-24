# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = Role.where(name: "Administrador").first_or_create
monitor = Role.where(name: "Monitor").first_or_create


User.create(email: "administrador@utp.edu.co", password: "@Administrador2016", password_confirmation: "@Administrador2016", full_name: "Administrador", role: admin) unless User.find_by(email: "administrador@utp.edu.co")
User.create(email: "malucy@utp.edu.co", password: "@Malucy2016", password_confirmation: "@Malucy2016", full_name: "Martha Lucy Estrella Ocampo", role: admin) unless User.find_by(email: "malucy@utp.edu.co")
