class Library

  attr_accessor :library_stock

  def initialize
    @library_stock = {}
  end

  def add_book_to_stock(book)
    if own_copy?(book.title)
      @library_stock[book.title][0] += 1
      @library_stock[book.title][1] << book
    else
      @library_stock[book.title] = [1, [book]]
    end

  end

  def own_copy?(book_title)
    @library_stock[book_title] != nil
  end

  def in_stock?(book_title)
    own_copy?(book_title) and @library_stock[book_title][1].length > 0
  end

  def print_book_status(book_title)
    unless own_copy?(book_title)
      puts "This library does not own a copy of: #{book_title}"
      return
    end

    num_in_stock = @library_stock[book_title][1].length
    num_on_loan = @library_stock[book_title][0] - num_in_stock

    puts "There are #{num_on_loan} copies of #{book_title} currently on loan and #{num_in_stock}"

  end

  def loan_out_book(book_title, user)
    if in_stock?(book_title)
      user.borrowed_books << @library_stock[book_title][1].last
      @library_stock[book_title][1].pop
      puts "A copy of #{book_title} was loaned to #{user.name}"
    else
      puts 'Book cannot be loaned as...'
      print_book_status(book_title)
    end
  end

  def accept_returned_book(book, user)
    if own_copy?(book.title)
      @library_stock[book.title][1] << book
      puts "A copy of #{book.title} was returned by #{user.name}"
    else
      puts 'Return cannot be accepted as that book does not belong to this library'
    end
  end

  def print_library_status
    printf "\n%-20s | %-10s | %-10s\n%s\n", "Book Name", "# In Stock", "# On Loan", "-"*50
    @library_stock.keys.each do |name|
      num_in_stock = @library_stock[name][1].length
      num_on_loan = @library_stock[name][0] - num_in_stock
      printf "%-20s | %-10s | %-10s\n", name, num_in_stock, num_on_loan
    end
    puts
  end



end