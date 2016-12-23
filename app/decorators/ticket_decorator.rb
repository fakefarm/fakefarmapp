class TicketDecorator

  attr_reader :tickets

  def initialize(tickets)
    @tickets = tickets
  end

  def count
    tickets.count
  end
end
