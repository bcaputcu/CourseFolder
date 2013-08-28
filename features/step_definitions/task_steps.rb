When(/^I create an task for that course$/) do
	step "I am on the new task page for that course"

	@task_attr = FactoryGirl.attributes_for(:task)

	fill_in("Name", with: @task_attr[:name])
	select_date(@task_attr[:start_date], from: "Start date")
	fill_in("Category", with: @task_attr[:category])

	expect { click_button("Create Task") }.to change {@course.tasks.count}
	@task = @course.tasks.find_by_name(@task_attr[:name])
end

When(/^I create an invalid task for that course$/) do
	step "I am on the new task page for that course"

	@task_attr = FactoryGirl.attributes_for(:task)

	fill_in("Name", with: @task_attr[:name])
	select_date(@task_attr[:start_date], from: "Start date")
	fill_in("Category", with: @task_attr[:category])

	expect { click_button("Create Task") }.not_to change {@course.tasks.count}
	@task = @course.tasks.find_by_name(@task_attr[:name])
end

When(/^I create an task without name for that course$/) do
	step "I am on the new task page for that course"

	@task_attr = FactoryGirl.attributes_for(:task)

	fill_in("Name", with: nil)
	select_date(@task_attr[:start_date], from: "Start date")
	fill_in("Category", with: @task_attr[:category])

	expect { click_button("Create Task") }.not_to change {@course.tasks.count}
	@task = @course.tasks.find_by_name(@task_attr[:name])
end

When(/^I create an task with an earlier date for that course$/) do
	step "I am on the new task page for that course"

	@task_attr = FactoryGirl.attributes_for(:task)

	fill_in("Name", with: @task_attr[:name])
	select_date(2.days.ago.strftime("%d/%m/%Y").to_s, from: "Start date")
	fill_in("Category", with: @task_attr[:category])

	expect { click_button("Create Task") }.not_to change {@course.tasks.count}
	@task = @course.tasks.find_by_name(@task_attr[:name])
end

Then(/^I should see new task form$/) do
	expect(page).to have_field "Name"
	expect(page).to have_field "Start date"
	expect(page).to have_field "Category"
end

Then(/^the course should have that task$/) do
	expect(@course.tasks).to include(@task)
end

Then(/^the course should not have that task$/) do
	expect(@course.tasks).not_to include(@task)
end

Then(/^I should see the task details$/) do
  expect(page).to have_content @task.name
  expect(page).to have_content @task.course.name
  expect(page).to have_content @task.start_date
end
