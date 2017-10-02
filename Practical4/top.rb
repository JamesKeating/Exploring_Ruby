require_relative "book"
require_relative "user"
require_relative "library"
def set_up_library
  book1 = Book.new("Harry Potter", "JK Rowling", 1, "Fantasy", 8)
  book2 = Book.new("Harry Potter", "JK Rowling", 2, "Fantasy", 8)
  book3 = Book.new("Lord Of The Rings", "Tolkien", 3, "Fantasy", 8)
  book4 = Book.new("Lord Of The Rings", "Tolkien", 4, "Fantasy", 8)
  book5 = Book.new("Game Of Thrones", "G.R.R.M", 5, "Fantasy", 8)

  books = [book1, book2, book3, book4, book5]
  library = Library.new

  books.each do |i|
    library.add_book_to_stock(i)
  end

  library
end

def borrow_event(library, user)
  puts "Initial Status:"
  library.print_library_status

  puts "\nBorrowing a book that dosnt exist"
  library.loan_out_book("blah blah", user)

  puts "\nBorrowing a book that is in stock"
  library.loan_out_book("Game Of Thrones", user)

  puts "\nBorrowing a that is out of stock"
  library.loan_out_book("Game Of Thrones", user)

  puts "\nLibrary status after Game Of Thrones was loaned out:"
  library.print_library_status
  puts "Book and user status after borrowing book:"
  p user.borrowed_books[0]
  p user

end

def return_event(library, user)
  puts "\nThis is the additional useful method I added it returns the book borrowed in the previous event:"
  puts "\nLibrary status before return:"
  library.print_library_status
  library.accept_returned_book(user.borrowed_books[0], user)
  puts "\nLibrary status after return:"
  library.print_library_status
end

def main
  user = User.new("Tom", "x street", "999")
  library = set_up_library

  borrow_event(library, user)
  return_event(library, user)
end

main
