require_relative('models/customer')
require_relative('models/film')

require('pry-byebug')

customer1 = Customer.new({
  'name' => 'Bill',
  'funds' => '1000'
  })

film1 = Film.new({
  'title' => 'Life of Pi',
  'price' => '10'
  })

binding.pry

nil
