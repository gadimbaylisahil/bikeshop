class StaticPagesController < ApplicationController
  def index
  	@products= Product.all
  	@featured_product = Product.first
  	@products = Product.limit(3)
  end
  def shop
  	@products = Product.all
  end
  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	ActionMailer::Base.mail(
  		:from => @email,
  		:to => 'sahil.gadimbay@gmail.com', 
  		:subject => "A new message from #{@name}", 
  		:body => @message).deliver_now
  end
end
