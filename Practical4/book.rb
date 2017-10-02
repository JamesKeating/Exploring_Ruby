class Book

  attr_accessor :title, :author, :id, :genre, :rating

  def initialize(title, author, id, genre, rating)
    @title = title
    @author = author
    @id = id
    @genre = genre
    @rating = rating
  end

end