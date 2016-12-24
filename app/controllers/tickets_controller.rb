class TicketsController < ApplicationController
  def index
    @tickets_decorator = TicketsDecorator.new(Ticket.all)
  end

  def show
    @ticket_decorator = TicketDecorator.new(Ticket.find(params[:id]))
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

  def update
    ticket = Ticket.find(params[:id])
    ticket.update(ticket_params)
    if ticket.save
      flash.notice = 'ticket updated' 
      redirect_to tickets_path
    end
  end  

private

  def ticket_params
    params.require(:ticket).permit(:title, :summary, :ticket, :merge, :date_started, :date_due)
  end
end
