class TicketStatusesController < ApplicationController
		before_action :set_TicketStatus, only: [:show, :edit, :update, :destroy]
	  before_action :require_user, only: [:index, :show, :new, :edit, :update, :destroy]
    before_action :require_admin, only: [:index,:show,:new, :edit]
	def index
		@ticket_statuses = TicketStatus.all
	end

	def edit
	end

	def new
		@ticket_status = TicketStatus.new
	end

	def create
		@ticket_status = TicketStatus.new(ticket_status_params)
		if @ticket_status.save
			redirect_to @ticket_status
		else
			render 'new'
		end
	end	

	def update
		if @ticket_status.update(ticket_status_params)
			redirect_to @ticket_status
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@ticket_status.destroy

		redirect_to ticket_statuses_path
	end

	private

		def set_TicketStatus
      @ticket_status = TicketStatus.find(params[:id])
    end

		def ticket_status_params
			params.require(:ticket_status).permit(:name)
		end
end
