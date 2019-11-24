require_relative("../db/sql_runner")
require_relative("film")
require_relative("customer")
require_relative("screening")

class Ticket

  attr_reader :id
  attr_accessor :cust_id, :film_id, :screening_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @cust_id = options['cust_id'].to_i
  @film_id = options['film_id'].to_i
  @screening_id = options['screening_id'].to_i
end

def save()
  sql = "INSERT INTO tickets (cust_id, film_id, screening_id) VALUES ($1, $2, $3) RETURNING id"
  values = [@cust_id, @film_id, @screening_id]
  ticket = SqlRunner.run(sql, values)[0]
  @id = ticket['id'].to_i
end

def self.delete_all()
  sql = "DELETE FROM tickets"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM tickets WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def update()
    sql = "UPDATE tickets SET (cust_id, film_id, screening_id) = ($1, $2,$3) WHERE id = $4"
    values = [@cust_id, @film_id, @screening_id, @id]
    SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * from tickets"
  results = SqlRunner.run(sql)
  return results.map{|result| Ticket.new(result)}
end

# def buy_ticket(customer, film)
#   fee = [film.price]
#   cust_funds = [customer.funds]
#   cust_funds -= fee
#   sql = "UPDATE customers SET (funds) VALUES ($1) WHERE id = $2"
#   values = [cust_funds, @cust_id]
#   customer.ticket_fee()
#   SqlRunner.run(sql, values)
#   end

  def self.no_of_tickets(customer)
    sql = "SELECT * FROM tickets WHERE cust_id = $1"
    values = [customer.id]
    result = SqlRunner.run(sql, values)
    ticket_list = result.map { |ticket| self.new(ticket)}
    return ticket_list.length
  end

  def self.no_of_customers(film)
    sql = "SELECT * FROM tickets WHERE film_id = $1"
    values = [film.id]
    result = SqlRunner.run(sql, values)
    customer_list = result.map { |customer| self.new(customer)}
    return customer_list.length
  end

  def self.no_of_tickets_by_screening(screening)
    sql = "SELECT * FROM tickets WHERE screening_id = $1"
    values = [screening.id]
    result = SqlRunner.run(sql, values)
    total_tickets = result.map { |ticket| self.new(ticket)}
    return total_tickets.length
  end


  def self.most_popular_screening()
    sql = "SELECT * FROM tickets"
    result = SqlRunner.run(sql)
    popular_film = result.max { |film| self.no_of_tickets_by_screening(film)}
    return popular_film
  end


end
