class ThanksMailer < ApplicationMailer
	def send_confirm_to_user(user)
		@user = user
	    mail to: user.email, subject: 'You’ve successfully registered!'
  	end
end
