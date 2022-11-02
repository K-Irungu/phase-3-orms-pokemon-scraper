require '../db/pokemon.db'
class Pokemon
    def self.table_name
        self.to_s.downcase + "s"
    end        
    
    def self.column_names 
        sql = "PRAGMA table_info('#{table_name}')"
        db = pokemon.db
        table_info = db.execute(sql)

        column_names = []
        table_info.each { |column| column_names << column["name"] }
        column_names.compact
    end
    
    self.column_names.each do |col_name|
        attr_accessor col_name.to_sym
    end
end
