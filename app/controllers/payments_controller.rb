class PaymentsController < ApplicationController
	def create
	token = params[:stripeToken]
	@user = current_user
	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
		charge = Stripe::Charge.create(
		:amount => current_order.total * 100, # amount in cents, again
		:currency => "usd",
		:source => token,
		:description => params[:stripeEmail]
		)
		rescue Stripe::CardError => e
			# The card has been declined
	  end
	redirect_to root_path
	end
end
