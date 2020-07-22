class Book
  attr_reader :title,
              :author,
              :publication_year,
              :checked_out,
              :checkout_count

  def initialize(info)
    @title = info[:title]
    @author = "#{info[:author_first_name]} #{info[:author_last_name]}"
    @publication_year = info[:publication_date].slice(-4, 4)
    @checked_out = false
    @checkout_count = 0
  end

  def checkout
    @checkout_count += 1
    @checked_out = true
  end

  def return
    @checked_out = false
  end
end
