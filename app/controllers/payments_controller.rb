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

		if charge.paid 
			Order.create(total: current_order.total)
			flash[:success] = "Payment has been completed."
		end

		rescue Stripe::CardError => e
			# The card has been declined
    		body = e.json_body
    		err = body[:error]
    		flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
	  	end
		redirect_to root_path, notice: 'Thank you for shopping with BikyLand. Your order was successful.'
	end
end
