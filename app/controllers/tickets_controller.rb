class TicketsController < ApplicationController
  def index
    @ticket_decorator = TicketDecorator.new(Ticket.all)
  end

  def new
    @ticket = Ticket.new
  end

  def create
    ticket = Ticket.create(ticket_params)
    if ticket.save
      flash.notice = ticket.title + ' was created'
      redirect_to tickets_path
    end
  end

private

  def ticket_params
    params.require(:ticket).permit(:title)
  end
end
