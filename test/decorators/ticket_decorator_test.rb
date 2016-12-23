require 'test_helper'

class TicketDecoratorTest < ActiveSupport::TestCase
  test "these are real" do
    tix = [tickets(:one), tickets(:two)]
    td = TicketDecorator.new(tix)
    assert_equal td.count, 2
  end
end
