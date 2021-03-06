require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'

class BookTest < Minitest::Test
  def setup
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
  end

  def test_it_exists
    assert_instance_of Book, @book
  end

  def test_it_has_a_title
    assert_equal "To Kill a Mockingbird", @book.title
  end

  def test_it_has_an_author
    assert_equal "Harper Lee", @book.author
  end

  def test_it_has_publication_year
    assert_equal "1960", @book.publication_year
  end

  def test_that_book_can_be_checked_out
    assert_equal false, @book.checked_out

    @book.checkout

    assert_equal true, @book.checked_out
  end

  def test_it_can_be_returned
    @book.checkout
    assert_equal true, @book.checked_out

    @book.return
    assert_equal false, @book.checked_out
  end

  def test_it_knows_checkout_count
    assert_equal 0, @book.checkout_count

    @book.checkout
    assert_equal 1, @book.checkout_count

    @book.return
    @book.checkout
    assert_equal 2, @book.checkout_count
  end
end
