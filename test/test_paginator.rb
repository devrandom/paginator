require 'test/unit'
require 'paginator'

class PaginatorTest < Test::Unit::TestCase

  PER_PAGE = 10

  def setup
    @data = (0..43).to_a
    @pager = Paginator.new(@data.size, PER_PAGE) do |offset,per_page|
      @data[offset,per_page]
    end
  end
  
  def test_initializing_paginator_raises_exception
    assert_raises(Paginator::MissingSelectError) do
      @pager = Paginator.new(@data.size, PER_PAGE)
    end
  end  
  
  def test_can_get_last_page_from_page_object
    assert_equal @pager.last, @pager.page(2).last
  end
  
  def test_can_get_first_page_from_page_object
    assert_equal @pager.first, @pager.page(2).first    
  end

  def test_does_not_exceed_per_page
    @pager.each do |page|
      assert page.items.size <= PER_PAGE
    end
  end
  
  def test_only_last_page_has_less_items
    @pager.each do |page|
      if page != @pager.last
        assert page.items.size <= PER_PAGE
      else
        assert page.items.size < PER_PAGE
      end
    end    
  end
  
  def test_returns_correct_first_page
    assert_equal @pager.page(1).number, @pager.first.number
  end
  
  def test_returns_correct_last_page
    assert_equal @pager.page(5).number, @pager.last.number
  end
  
  def test_last_page_has_no_next_page
    assert !@pager.last.next?
    assert !@pager.last.next
  end

  def test_first_page_has_no_prev_page
    assert !@pager.first.prev?
    assert !@pager.first.prev
  end
  
  def test_each
    @pager.each do |page|
      assert page
      page.each do |item|
        assert item
      end
    end
  end
  
  def test_number_of_pages
    assert_equal 5, @pager.number_of_pages
  end
  
  def test_passing_block_to_initializer_with_arity_of_two_yields_per_page
    pager = Paginator.new(20,2) do |offset,per_page|
      assert_equal 2, per_page
    end
    pager.page(1).items
  end

  def test_passing_block_to_initializer_with_arity_of_one_does_not_yield_per_page
    pager = Paginator.new(20,2) do |offset|
      assert_equal 0, offset
    end
    pager.page(1).items
  end
  
  

end