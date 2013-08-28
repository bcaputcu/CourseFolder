Feature: Dashboard
	In order to see news
	As a user
	I want to be able to see my dashboard

	Background:
		Given I am signed in

	Scenario: Upcoming tasks
		Given a course exists
		And I enroll to that course
		When I create an task for that course
		And I go to my dashboard
		Then I should see the task details

	Scenario: My courses
		Given 2 courses exist
		And I enroll to all courses
		When I go to my dashboard
		Then I should see names of all courses