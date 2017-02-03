require 'new_relic/agent/method_tracer'

class TicketDecorator
  include ::NewRelic::Agent::MethodTracer

  attr_reader :ticket

  def initialize(ticket)
    @ticket = ticket
  end

  def ticket_url
    "http://jira.pm/browse/#{ticket.ticket}"
  end

  def headline
    if ticket.title?
      ticket.title
    else
      ticket.ticket
    end
  end

  def method_missing(method_name, *args, &block)
    ticket.send(method_name, *args, &block)
  end

  add_method_tracer :headline, 'Custom/headline'
  add_method_tracer :ticket_url, 'Custom/ticket_url'
end
