require('pg')


class SqlRunner

  def self.run(sql, tag, values)
    begin
      db = PG.connect({ dbname: 'record_store', host: 'localhost'})
      db.prepares(tag, sql)
      results = exec_prepared(tag, values)
    ensure
      db.close()
    end
    return results if results
  end

end
