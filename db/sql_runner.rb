require('pg')

class SqlRunner

  def self.run(sql, tag, values)
    begin
      db = PG.connect({ dbname: 'record_store', host: 'localhost' })
      db.prepare(tag, sql)
      results = db.exec_prepared(tag, values)
    ensure
      db.close()
    end
    return results if results
  end

end
