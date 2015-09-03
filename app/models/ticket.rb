class Ticket < ActiveRecord::Base
	validates_presence_of [:subject, :description, :service_id, :ticket_status_id]
	belongs_to :service
	belongs_to :ticket_status
	belongs_to :user
	belongs_to :tech, class_name: "User", foreign_key: "tech_id"
	has_many :notes, dependent: :destroy
	scope :user_tickets, ->(id) { where(user_id: id)}
	scope :tech_tickets, ->(id) { where(tech_id: id)}
	mount_uploader :attachment, AttachmentUploader
end
