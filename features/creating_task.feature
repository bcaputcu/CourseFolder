Feature: Creating task
	In order to create an task for a course
	As a member of the course
	I want to be able to create an task

	Background:
		Given I am signed in
		And a course exists

	Scenario: Creating a valid task
		Given I enroll to that course
		When I create an task for that course
		Then I should be on that course's page
		And the course should have that task

	Scenario: Creating an task without name
		Given I enroll to that course
		When I create an task without name for that course
		Then I should see new task form

	Scenario: Creating an task for a course I don't belong to
		When I create an invalid task for that course
		Then I should be on that course's page
		And the course should not have that task
