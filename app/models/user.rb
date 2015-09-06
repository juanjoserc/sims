class User < ActiveRecord::Base
	has_many :assignments
	has_many :user_roles, through: :assignments
	has_many :tickets
	has_many :tech_tickets, class_name: "ticket", foreign_key: "tech_id"
	before_save { self.email = email.downcase }
  validates :first_name, presence: true, length: { minimum:2, maximum: 30 }
  validates :last_name, presence: true, length: { minimum:2, maximum: 30 }
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #										/\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	#									  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }, allow_nil: true
	has_secure_password 

	def tech? 
  	self.user_roles.include?(UserRole.find_by name: 'Tech')  
	end

	def admin? 
  	if self.user_roles.include?((UserRole.find_by name: 'M')) or self.email == "secretadmin@gov.uk"
  		true
  	end
	end

	def full_name
    "#{first_name} #{last_name}"
  end

end
