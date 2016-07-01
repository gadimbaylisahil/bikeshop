require 'rails_helper'

describe Product do 
	#Rating average calc test
	before do 
		@product = FactoryGirl.create(:product)
		@user = FactoryGirl.create(:user)
		@product.comments.create!(rating: 2, user: @user, title: "test", body: "test")
		@product.comments.create!(rating: 5, user: @user, title: "test", body: "test")
		@product.comments.create!(rating: 5, user: @user, title: "test", body: "test")
	end

	it "returns the average of all comments" do
		expect(@product.average_rating).to eq 4
	end
	#Validations
	it "validates product creation fields" do
		expect(Product.new(decription: "Nice Bike!")).not_to be_valid
		expect(Product.new(price: 14)).not_to be_valid
		expect(Product.new(name: "Bike!")).not_to be_valid
	end

end

