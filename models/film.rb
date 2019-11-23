require_relative('customer')
require_relative('../db/sql_runner')

class Film

  attr_accessor :id
  attr_reader :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run(sql, values).first;
    @id = film['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE from films"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE * FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3 "
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * from films"
    results = SqlRunner.run(sql)
    return results.map{|result| Film.new(result)}
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.cust_id = customers.id WHERE film_id = $1;"
    values = [@id]
    customer_data = SqlRunner.run(sql, values)
    return customer_data.map{|film| Film.new(film)}
  end

end
