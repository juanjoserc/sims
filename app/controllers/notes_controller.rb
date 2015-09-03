class NotesController < ApplicationController
	def create
		@ticket = Ticket.find(params[:ticket_id])
		@note = @ticket.notes.create(note_params)
		redirect_to @ticket
	end
	
	private
		def note_params
			params.require(:note).permit(:note,:user_id)
		end
end
