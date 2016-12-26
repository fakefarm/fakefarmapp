require 'test_helper'

class TicketDecoratorTest < ActiveSupport::TestCase
  test 'single ticket has a show method' do
    tix = tickets(:one)
    td = TicketDecorator.new(tix)
    assert_equal td.title, tix.title
  end

  test 'headline provides info' do
    tix = tickets(:two)
    td = TicketDecorator.new(tix)
    assert_equal td.headline, tix.ticket
  end
end
