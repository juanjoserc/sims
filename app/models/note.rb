class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :ticket
  after_save :note_notification

private
		def note_notification
			TicketMailer.new_note(self).deliver_now
		end
end
