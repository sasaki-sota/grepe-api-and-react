# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
nozaki_mado = Author.create(name: "野崎まど")
Book.create(title: "know", price: 720, author: nozaki_mado)
Book.create(title: "野崎まど劇場", price: 610, author: nozaki_mado)

jason_fried = Author.create(name: "ジェイソン・フリード")
Book.create(title: "小さなチーム、大きな仕事", price: 640, author: jason_fried)
Book.create(title: "強いチームはオフィスを捨てる", price: 1500, author: jason_fried)
