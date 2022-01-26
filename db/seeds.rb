require 'faker'

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "limpiando base de datos"
Truck.destroy_all


# Truck.create(brand: "Mercedez", model: 1992, description: "klasdñasd", capacity: 55555, price: 1995)

20.times do
  Truck.create(
    user: User.last,
    brand: Faker::Vehicle.make,
    model: Faker::Vehicle.year,
    description: Faker::Vehicle.car_type,
    capacity: rand(1000..10000),
    price: rand(40000..1000000)
)
end
