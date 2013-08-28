Feature: Creating courses
	In order to add a new course to the system
	As a user
	I want to be able to create new courses

	Background:
		Given I am signed in
		And I am on the new course page

	Scenario: Creating a valid course
		When I create a course
		Then I should be on that course's page
		And I should be a member of that course

	Scenario: Creating a course without name
		When I create a course without name
		Then I should see new course form

	Scenario: Creating a course with same name
		Given a course exists
		When I create a course with existing name
		Then I should see new course form
