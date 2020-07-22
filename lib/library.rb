class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author.books.each { |book| @books << book  }
  end

  def publication_time_frame_for(author)
    {start: author.first_book.publication_year, end: author.last_book.publication_year}
  end

  def checkout(book)
    if @books.include?(book) && !book.checked_out
      book.checkout
    else
      false
    end
  end

  def checked_out_books
    @books.find_all { |book| book.checked_out }
  end

  def return(book)
    book.return if @books.include?(book) && book.checked_out
  end

  def most_popular_book
    @books.max_by { |book| book.checkout_count }
  end
end
