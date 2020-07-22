require 'minitest/autorun'
require 'minitest/pride'
require './lib/author'
require './lib/book'
require './lib/library'

class LibraryTest < Minitest::Test
  def setup
    @dpl = Library.new("Denver Public Library")
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    @professor = @charlotte_bronte.write("The Professor", "1857")
    @villette = @charlotte_bronte.write("Villette", "1853")

    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_it_has_readable_attributes
    assert_equal "Denver Public Library", @dpl.name
    assert_equal [], @dpl.books
    assert_equal [], @dpl.authors
  end

  def test_it_can_add_authors
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    assert_equal [@charlotte_bronte, @harper_lee], @dpl.authors
  end

  def test_it_can_add_books_from_authors
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    assert_equal [@jane_eyre, @professor, @villette, @mockingbird], @dpl.books
  end

  def test_publication_time_frame
    @dpl.add_author(@charlotte_bronte)
    @dpl.add_author(@harper_lee)

    expected_cb = {:start=>"1847", :end=>"1857"}
    expected_hl = {:start=>"1960", :end=>"1960"}

    assert_equal expected_cb, @dpl.publication_time_frame_for(@charlotte_bronte)
    assert_equal expected_hl, @dpl.publication_time_frame_for(@harper_lee)
  end

  def test_it_can_checkout_books
    assert_equal false, @dpl.checkout(@mockingbird)
    assert_equal false, @dpl.checkout(@jane_eyre)

    @dpl.add_author(@charlotte_bronte)

    assert_equal true, @dpl.checkout(@jane_eyre)
  end

  def test_it_know_which_books_are_checked_out
    @dpl.add_author(@charlotte_bronte)
    @dpl.checkout(@jane_eyre)

    assert_equal [@jane_eyre], @dpl.checked_out_books
  end
end
