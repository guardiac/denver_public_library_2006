class Book
  attr_reader :title,
              :author,
              :publication_year
  def initialize(info)
    @title = info[:title]
    @author = "#{info[:author_first_name]} #{info[:author_last_name]}"
    @publication_year = info[:publication_date].slice(-4, 4)
  end
end
