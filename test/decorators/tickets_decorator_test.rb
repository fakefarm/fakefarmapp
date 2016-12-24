require 'test_helper'

class TicketsDecoratorTest < ActiveSupport::TestCase
  test "these are real" do
    tix = [tickets(:one), tickets(:two)]
    td = TicketsDecorator.new(tix)
    assert_equal td.count, 2
  end
end
