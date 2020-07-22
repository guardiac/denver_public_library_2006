class Book
  attr_reader :title
  def initialize(info)
    @title = info[:title]
  end
end
