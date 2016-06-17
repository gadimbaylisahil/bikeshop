class StaticPagesController < ApplicationController
  
  def index
  	@products= Product.all
  	@featured_product = Product.first
  	@products = Product.limit(3)
  end

  def shop
  	@products = Product.all
    @comments = Comment.all
  end

  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end
