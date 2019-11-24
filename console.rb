require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

require('pry-byebug')

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()
Screening.delete_all()

customer1 = Customer.new({
  'name' => 'Bill',
  'funds' => '1000'
  })

customer1.save()

  customer2 = Customer.new({
    'name' => 'Dave',
    'funds' => '100'
    })

    customer2.save()

    customer3 = Customer.new({
      'name' => 'Jane',
      'funds' => '800'
      })

    customer3.save()

      customer4 = Customer.new({
        'name' => 'Jen',
        'funds' => '500'
        })

        customer4.save()

film1 = Film.new({
  'title' => 'Life of Pi',
  'price' => '10'
  })

film1.save()

  film2 = Film.new({
    'title' => 'Joker',
    'price' => '12'
    })

film2.save()

screening1 = Screening.new({
  'film_id' => film1.id,
  'showing_time' => '20:30'
  })

  screening1.save

  screening2 = Screening.new({
    'film_id' => film2.id,
    'showing_time' => '16:30'
    })

    screening2.save


ticket1 = Ticket.new({
  'cust_id' => customer1.id,
  'film_id' => film1.id,
  'screening_id' => screening1.id
  })

  ticket1.save()

  ticket2 = Ticket.new({
    'cust_id' => customer2.id,
    'film_id' => film2.id,
    'screening_id' => screening2.id
    })

    ticket2.save()

    ticket3 = Ticket.new({
      'cust_id' => customer1.id,
      'film_id' => film1.id,
      'screening_id' => screening1.id
      })

      ticket3.save()

      ticket4 = Ticket.new({
        'cust_id' => customer3.id,
        'film_id' => film2.id,
        'screening_id' => screening2.id
        })

        ticket4.save()



binding.pry

nil
