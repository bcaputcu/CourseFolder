Given(/^a course exists$/) do
	@course = FactoryGirl.create(:course)
end

Given(/^(\d+) courses exist$/) do |n|
	@courses = []
  n.to_i.times do
  	step "a course exists"
  	@courses << @course
  end
end

When(/^I create a course$/) do
	step "I am on the new course page"

	@course_attr = FactoryGirl.attributes_for(:course)

	fill_in("Name", with: @course_attr[:name])
	fill_in("School", with: @course_attr[:school])
	fill_in("Instructor", with: @course_attr[:instructor])

	expect { click_button("Create Course") }.to change {Course.count}
	@course = Course.find_by_name(@course_attr[:name])
end

Then(/^I should be a member of that course$/) do
	expect(@user.courses.find_by_id(@course.id)).to eq @course
end

When(/^I create a course without name$/) do
	step "I am on the new course page"

	@course_attr = FactoryGirl.attributes_for(:course)

	fill_in("Name", with: nil)
	fill_in("School", with: @course_attr[:school])
	fill_in("Instructor", with: @course_attr[:instructor])

	expect { click_button("Create Course") }.not_to change {Course.count}
end

Then(/^I should see new course form$/) do
	expect(page).to have_field "Name"
	expect(page).to have_field "School"
	expect(page).to have_field "Instructor"
end

When(/^I create a course with existing name$/) do
	step "I am on the new course page"

	fill_in("Name", with: @course.name)
	fill_in("School", with: @course.school)
	fill_in("Instructor", with: @course.instructor)

	expect { click_button("Create Course") }.not_to change {Course.count}
end

When(/^I enroll to that course$/) do
	step "I am on that course's page"
	
	expect { click_button("Enroll") }.to change {Enrollment.count}
end

Given(/^I am a member of a course$/) do
	step "a course exists" unless @course
	expect { @user.enrollments.create(course_id: @course.id) }.to change {Enrollment.count}
end

When(/^I drop that course$/) do
	expect { click_button("Drop") }.to change {Enrollment.count}
end

Then(/^I should no longer be a member of that course$/) do
	expect(@user.courses.find_by_id(@course.id)).to be_nil
end

Then(/^I should see last (\d+) courses$/) do |n|
	@courses.last(n.to_i).each do |course|
		expect(page).to have_content course.name
	end
end

Given(/^I enroll to all courses$/) do
  @courses.each do |course|
  	@course = course
  	step "I enroll to that course"
  end
end

Then(/^I should see names of all courses$/) do
  @courses.each do |course|
  	expect(page).to have_content course.name
  end
end
