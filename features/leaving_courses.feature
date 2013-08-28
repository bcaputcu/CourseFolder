Feature: Leaving courses
	In order to stop following a course
	As a member of a course
	I want to drop that course

	Background:
		Given I am signed in
		And I am a member of a course

	Scenario: Leave the course from course page
		When I am on that course's page
		And I drop that course
		Then I should no longer be a member of that course
		And I should be on that course's page