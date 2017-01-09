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

  test 'ticket_url sends text to static jira url' do
    tix = tickets(:one)
    jira =  "http://jira.pm/browse/#{tix.ticket}"
    td = TicketDecorator.new(tix)
    assert_equal td.ticket_url, jira
  end
end
