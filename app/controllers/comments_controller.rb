class CommentsController < ApplicationController

	def create
		@product = Product.find(params[:product_id])
  	@comment = @product.comments.new(comment_params)
  	@comment.user = current_user
  	respond_to do |format|
      if @comment.save
        format.html { redirect_to :back, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
        format.js
      else
        format.html { redirect_to :back, alert: 'Review was not saved successfully. Please fill out all fields' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if signed_in? && current_user.admin? 
      @comment = Comment.find(params[:id])
      product = @comment.product
      @comment.destroy
    end
    redirect_to :back
  end

	private

  	def comment_params
    	params.require(:comment).permit(:user_id, :title, :body, :rating)
  	end
end