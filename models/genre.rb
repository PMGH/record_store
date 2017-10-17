class Genre

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  # CRUD

  def self.all()
    sql = "SELECT * FROM genres;"
    values = []
    results = SqlRunner.run(sql, "get_genres", values)
    return results.map { |genre| Genre.new(genre) }
  end

end
