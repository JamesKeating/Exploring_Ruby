class User

  attr_accessor :name, :address, :id, :borrowed_books

  def initialize(name, address, id)
    @name = name
    @address = address
    @id = id
    @borrowed_books = []
  end


end