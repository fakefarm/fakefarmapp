class TicketsController < ApplicationController
  def index
  end

  def new
    @ticket = Ticket.new
  end

  def create
    ticket = Ticket.create(ticket_params)
    if ticket.save
      redirect_to tickets_path
    end
  end

private

  def ticket_params
    params.require(:ticket).permit(:title)
  end
end
