# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'dotenv/load'

Admin.find_or_create_by!(email: "sample@gmail.com") do |admin|
  admin.password = ENV['ADMIN_PASSWORD']
  puts "Adminのパスワードを設定しました。"
end

puts admin.inspect
