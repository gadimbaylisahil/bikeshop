class StaticPagesController < ApplicationController
  def index
  	@products= Product.all
  	@featured_product = Product.first
  	@products = Product.limit(3)
  end
  def shop
  	@products = Product.all
  end
end
