class Author
  attr_reader :name,
              :books

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @name = "#{info[:first_name]} #{info[:last_name]}"
    @books = []
  end

  def write(title, date)
    @books << Book.new({author_first_name: @first_name, author_last_name: @last_name, title: title, publication_date: date})
    @books.last
  end

  def first_book
    @books.min_by { |book| book.publication_year.to_i }
  end

  def last_book
    @books.max_by { |book| book.publication_year.to_i }
  end
end
