class Pokemon
<<<<<<< HEAD
   attr_accessor :name, :type, :db, :id, :hp


  def initialize(keywords)
   
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(num, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", [num])
    new_pokemon = self.new(pokemon)
    new_pokemon.id = pokemon[0][0]
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
    new_pokemon.hp = pokemon[0][3]
    return new_pokemon
  end

  def alter_hp(num, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [num], [self.id])
    self.hp = num
  end
end 
=======
  attr_accessor :name, :type, :id, :db 
  
  def initialize(name, type, id=nil, db)
    @name = name
    @type = type 
    @db = db
    @id = id 
  end 
  
  def save
    sql = <<-SQL
      INSERT INTO pokemon (name, type, db)
      VALUES (?, ?, ?)
        SQL
        DB[:conn].execute(sql, self.name, self.type, self.db)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0][0]
  end

 
end
>>>>>>> a53eca79536b3de92a1f891f0381f2fe0a952e43
