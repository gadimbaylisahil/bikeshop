require 'rails_helper'

describe UsersController, :type => :controller do 

	before do 
		@user = FactoryGirl.create(:user)
		@user2 = FactoryGirl.create(:user_two)
	end

	describe "GET #show" do

		context "user is logged in" do

			before do 
				sign_in @user
			end

			context "loads correct user details" do

				before do 
					get :show, :id => @user.id
				end

				it "responds successfully with an HTTP 200 status code" do
	      			expect(response).to be_success
	      			expect(response).to have_http_status(200)
	    		end

	    		it "assigned user is created user" do
	    			expect(assigns(:user)).to eq @user
	    		end
	    	end

	    	context "another user" do
	    		it "redirects to login page" do 
	    			get :show, :id => @user2.id
	    			expect(response).to redirect_to(root_path)
	    		end
	    	end
	    end


		context "user is not logged in" do

			it "redirects to login" do
				get :show, id: @user.id 
				expect(response).to redirect_to(root_path)
			end

		end

	end

end