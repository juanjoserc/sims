class TicketsController < ApplicationController
	before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show, :new, :edit, :update, :destroy]
 
  def about #for a static page
  end

	def index
		if @current_user.admin?
			@tickets = Ticket.all 
		elsif	@current_user.tech?
			@tickets = Ticket.tech_tickets(@current_user) 
		else	
		@tickets = Ticket.user_tickets(@current_user)
		end
	end

	def edit
	end

	def new
		@ticket = Ticket.new
	end

	def create
		@ticket = Ticket.new(ticket_params)
		if @ticket.save
			redirect_to @ticket
		else
			render 'new'
		end
	end	

	def update
		if @ticket.update(ticket_params)
			redirect_to @ticket
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@ticket.destroy

		redirect_to tickets_path
	end

	private

		def set_ticket
      @ticket = Ticket.find(params[:id])
    end

		def ticket_params
			params.require(:ticket).permit(:subject, :description, :estimated_resolution_time, :service_id, :ticket_status_id, :attachment, :tech_id)
		end
end
