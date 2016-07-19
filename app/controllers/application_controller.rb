class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order
  add_flash_types :success
  
  def current_order
      if !session[:order_id].nil? 
        Order.find(session[:order_id])
      else
        Order.new
      end
  end

  #redirecting users to landing page / access denial 
  rescue_from CanCan::AccessDenied do |exception|
  	redirect_to main_app.root_url, :alert => exception.message, :message => "You are not authorized for the given page!"
  end

end
