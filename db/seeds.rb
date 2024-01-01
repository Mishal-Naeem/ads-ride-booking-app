# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(first_name: 'test', last_name: 'admin', email: 'admin@gmail.com', phn_num: '3000000003', address: 'xyz', password: 'test123', city: 'lhr' )
driver = Driver.create(first_name: 'test', last_name: 'driver', email: 'driver@gmail.com', phn_num: '3000000003', address: 'xyz', password: 'test123', city: 'lhr' )
passenger = Passenger.create(first_name: 'test', last_name: 'passenger', email: 'passenger@gmail.com', phn_num: '3000000003', address: 'xyz', password: 'test123', city: 'lhr' )

vehicleType1 = VehicleType.create(name: 'car', description: 'Car with AC', engine_size: '1000', seating_capacity: 6)
vehicleType2 = VehicleType.create(name: 'Mini car', description: 'Car with no AC', engine_size: '600', seating_capacity: 4)
VehicleType.create(name: 'Bike', description: 'Bike', engine_size: '400', seating_capacity: 1)

Vehicle.create([
  { VIN_NUM: '1233', color: 'white', plate_num: 'XYZ', user_id: driver.id, vehicle_type_id: vehicleType1.id, model: 'abc', brand: 'test', year: 2000, is_available: true },
  { VIN_NUM: '1233', color: 'white', plate_num: 'XYZ', user_id: driver.id, vehicle_type_id: vehicleType2.id, model: 'abc', brand: 'test', year: 2000, is_available: true }
])

RideRequest.create([
  { source: 'test source', destination: 'test destination', estimated_amount: 2300, user_id: passenger.id },
  { source: 'test source', destination: 'test destination', estimated_amount: 700, user_id: passenger.id, status: 'canceled' },
  { source: 'Emporium', destination: 'ADS', estimated_amount: 500, user_id: passenger.id, status: 'completed' }
])

trip = Trip.create(ride_request_id: RideRequest.find_by(status: 'completed'), distance: 20, amount: 500, driver_id: Driver.first.id, passenger_id: Passenger.first.id, vehicle_id: Driver.first.vehicles.first.id)
PromoCode.create([
  {code: 'XYZ23', expiry_date: DateTime.now + 1.day, usage_limit: 400, discount: 100, user_id: passenger.id},
  {code: 'RIDE123', expiry_date: DateTime.now + 1.day, usage_limit: 400, discount: 100, user_id: passenger.id}
])
PaymentMethod.create(user_id: RideRequest.first.user_id, ride_request_id: RideRequest.first.id)
transaction = Transaction.create(trasaction_date_and_time: DateTime.now, amount: trip.amount, status: 'completed', driver_id: trip.driver_id, payment_method_id: trip.ride_request.payment_method.id, trip_id: trip.id, passenger_id: trip.passenger_id)
Refund.create(user_id: passenger.id, amount: 300, transaction_id:  transaction.id )
Review.create!(user_id: driver.id, reviewer_id: passenger.id, rating: 4, comment: 'good')
