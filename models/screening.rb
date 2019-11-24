require_relative("../db/sql_runner")
require_relative("film")
require_relative("ticket")

class Screening

  attr_reader :id
  attr_accessor :film_id, :showing_time

def initialize(options)
  @id = options['id'].to_i if options['id']
  @film_id = options['film_id'].to_i
  @showing_time = options['showing_time']
end

def save()
  sql = "INSERT INTO screenings (film_id, showing_time) VALUES ($1, $2) RETURNING id"
  values = [@film_id, @showing_time]
  screening = SqlRunner.run(sql, values)[0]
  @id = screening['id'].to_i
end

def self.delete_all()
  sql = "DELETE FROM screenings"
  SqlRunner.run(sql)
end

def delete()
  sql = "DELETE FROM screenings WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def update()
    sql = "UPDATE screenings SET (film_id, showing_time) = ($1, $2, $3) WHERE id = $4"
    values = [@film_id, @showing_time, @id]
    SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * from screenings"
  results = SqlRunner.run(sql)
  return results.map{|result| Screening.new(result)}
end


end
