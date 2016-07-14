class PaymentsController < ApplicationController
	add_flash_types :success
	def create
	token = params[:stripeToken]
	@user = current_user
	  # Create the charge on Stripe's servers - this will charge the user's card
	  begin
		charge = Stripe::Charge.create(
		:amount => (current_order.total * 100).to_i, # amount in cents, again
		:currency => "usd",
		:source => token,
		:description => params[:stripeEmail]
		)

		if charge.paid 
			Order.create(total: current_order.total)
			#clear order_items after payment
			@order = current_order
			@order.order_items.each do |order_item|
				order_item.destroy
			end
			redirect_to root_path, success: 'Thank you for shopping with BikyLand. Your order was successful.'
		end

		rescue Stripe::CardError => e
			# The card has been declined
    		body = e.json_body
    		err = body[:error]
    		flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
	  	end
	end
end
