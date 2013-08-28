Given(/^a user exists$/) do
	@user_attr = FactoryGirl.attributes_for(:user)
	@user = User.create(@user_attr)
end

Given(/^I am signed in$/) do
	steps %Q{
		Given a user exists
		And I go to the sign in page
		And I sign in as a user
	}
end

When(/^I sign up as another user$/) do
	step "I go to the sign up page"

	@another_user_attr = FactoryGirl.attributes_for(:user)

	fill_in("Email", with: @another_user_attr[:email])
	fill_in("Password", with: @another_user_attr[:password])
	fill_in("Password confirmation", with: @another_user_attr[:password_confirmation])

	expect{ click_button("Sign up") }.to change{User.count}
end

When(/^I sign up as an existing user$/) do
	step "I go to the sign up page"
	
	fill_in("Email", with: @user.email)
	fill_in("Password", with: @user.password)
	fill_in("Password confirmation", with: @user.password_confirmation)

	expect{ click_button("Sign up") }.not_to change{User.count}
end

When(/^I sign in as a user$/) do
	step "I go to the sign in page"

	fill_in("Email", with: @user.email)
	fill_in("Password", with: @user.password)

	click_button("Sign in")
end

Then(/^there should be (\d+) users$/) do |n|
	User.count.should eql(n.to_i)
end

Then(/^I should be signed in$/) do
	expect(page).to have_content @user.email
end

Then(/^another user should be signed in$/) do
	expect(page).to have_content @another_user_attr[:email]
end

Then(/^I should not be signed in$/) do
	expect(page).not_to have_content @user.email
end