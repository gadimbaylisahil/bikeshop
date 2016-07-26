class StaticPagesController < ApplicationController
  def index
  	@products= Product.paginate(:page => params[:page], :per_page => 2)
  	@products = Product.limit(3)
    @order_item = current_order.order_items.new
  end

  def shop
  	@products= Product.paginate(:page => params[:page], :per_page => 2)
    @comments = Comment.all
    @order_item = current_order.order_items.new
  end

  def orders 
    @orders = Order.all
  end

  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end
