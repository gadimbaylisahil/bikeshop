class StaticPagesController < ApplicationController
  
  def index
  	@products= Product.paginate(:page => params[:page], :per_page => 2)
  	@featured_product = Product.first
  	@products = Product.limit(3)
  end

  def shop
  	@products= Product.paginate(:page => params[:page], :per_page => 2)
    @comments = Comment.all
  end

  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	UserMailer.contact_form(@email, @name, @message).deliver_now
  end

end
