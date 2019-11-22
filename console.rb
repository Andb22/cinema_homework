require_relative('models/customer')
require_relative('models/film')

require('pry-byebug')

customer1 = Customer.new({
  'name' => 'Bill',
  'funds' => '1000'
  })

binding.pry

nil
