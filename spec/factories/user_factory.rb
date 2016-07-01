FactoryGirl.define do
	factory :user do 
		email "test@test.com"
		password "testtest"
		first_name "Test"
		last_name "Test"
		admin false
	end

	factory :user_two, class: User do
		email "test2@test.com"
		password "testtest2"
		first_name "Test2"
		last_name "Test2"
		admin false 
	end
end