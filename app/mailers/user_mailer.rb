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
end
