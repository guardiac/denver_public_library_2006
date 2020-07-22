class Author
  attr_reader :name,
              :books

  def initialize(info)
    @name = "#{info[:first_name]} #{info[:last_name]}"
    @books = []
  end
end
