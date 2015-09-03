class TicketMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.new_note.subject
  #
  def new_note(note)
  	@note = note
    @greeting = "Hi agent #{@note.ticket.user.last_name}"

    mail to: @note.ticket.user.email, subject: "Ticket ##{@note.ticket.id} updated."
  end
end
