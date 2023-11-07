# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Menu.create!(
  menu_title: "カットのみ",
  menu_sub_title: "cut only",
  menu_explanation: "カットだけだよ",
  price: "1200~"
  )

Admin.create!(
  email: "sample@gmail.com",
  password: "adminadmin"
  )
