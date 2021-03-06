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
				#assign userID to the purchased order ID
				current_order.update(:total => current_order.total, :user_id => current_user.id)
				#kill current order's session 
				session[:order_id] = nil

				#send purchase confirmation with email
				@name = current_user.first_name
				@purchase_order_id = current_order.id
				@email = current_user.email
				UserMailer.purchase(@name, @purchase_order_id, @email).deliver_now
			
				#clear order_items after payment
				@order = current_order
				@order.order_items.each do |order_item|
					order_item.destroy
				end
				redirect_to root_path, success: 'Thank you for shopping with BikyLand. Your order was successful.'
			end
		end

		rescue Stripe::CardError => e
			# The card has been declined
    		body = e.json_body
    		err = body[:error]
    		flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    	end
	end