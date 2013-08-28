Given(/^I am on the new course page$/) do
  visit new_course_path
end

Given(/^I am on the course index page$/) do
  visit courses_path
end

Given(/^I am on that course's page$/) do
	visit course_path @course
end

Given(/^I am on the new task page for that course$/) do
  visit new_course_task_path @course
end

When(/^I go to the sign up page$/) do
	visit new_user_registration_path
end

When(/^I go to the sign in page$/) do
	visit new_user_session_path
end

When(/^I go to the sign out page$/) do
	visit destroy_user_session_path
end

When(/^I go to my dashboard$/) do
  visit '/dashboard' 
end

When(/^I go to new course page$/) do
  visit new_course_path
end

When(/^I go to an empty course's page$/) do
  visit course_path -1
end

Then(/^I should be on that course's page$/) do
	expect(current_path).to eq course_path @course
end

Then(/^I should be on new course page$/) do
  expect(current_path).to eq new_course_path
end

Then(/^I should be on course index page$/) do
  expect(current_path).to eq courses_path
end

Then(/^I should be on new note page$/) do
  expect(current_path).to eq new_note_path
end