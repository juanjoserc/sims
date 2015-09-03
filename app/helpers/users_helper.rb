module UsersHelper
	def user_name(user_id)
		@user = User.find(user_id)
		full_name = "#{@user.first_name}  #{@user.last_name}"
	end
end
