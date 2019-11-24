require_relative('film')
require_relative('../db/sql_runner')


class Customer

attr_reader :id
attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = 'INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id ;'
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE from customers"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3 "
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * from customers"
    results = SqlRunner.run(sql)
    return results.map{|result| Customer.new(result)}
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE cust_id = $1;"
    values = [@id]
    film_data = SqlRunner.run(sql, values)
    return film_data.map{|customer| Customer.new(customer)}
  end

  # def ticket_fee(price)
  #   @funds -= price
  #   sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3 "
  #   values = [@name, @funds, @id]
  #
  #   SqlRunner.run(sql, values)
  # end

end
