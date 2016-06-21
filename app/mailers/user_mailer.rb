class UserMailer < ApplicationMailer
	default from: "from@example.com"

	def contact_form(email, name, message)
		@message = message
			mail(
				:from => email,
				:to => 'sahil.gadimbay@gmail.com',
				:subject => "A new message from #{name}"
				)
		@name = name
	end

	def welcome(user)
		@appname = "Bike Shop"
		mail(
				:to => user.email,
				:subject => "Welcome to #{@appname}!")
	end
end
