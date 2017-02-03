require 'new_relic/agent/method_tracer'

class TicketsController < ApplicationController
  include ::NewRelic::Agent::MethodTracer

  def index
    @ticket = Ticket.new
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
      redirect_to ticket_path(ticket)
    end
  end

  add_method_tracer :index, 'Custom/index'


private

  def ticket_params
    params.require(:ticket).permit(:title, :summary, :ticket, :merge, :date_started, :date_due, :started, :trashed, :paused, :blocked, :completed)
  end
end
