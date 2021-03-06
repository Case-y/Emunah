Feature: Basic users have a variety of actions they can take.
 
  As a member of Emunah's congregation
  So that I can get access to the features provided on the website
  I want to be able to create a basic account

Background: Rabbi (Seth) has been added as a super user of the Emunah organization
  
  Given the following users exist:
  | email                 | password | full_name   | status |
  | seth.martin@gmail.com | abcde    | Seth Martin | True   |
  | wayne.li@berkeley.edu | 12345    | Wayne Li    | False  |

  And I am on the home page
  Then I should see "Welcome to Congregation B'nai Emunah's Internal Tool!"

Scenario: login as basic user, and see last log-in
  When I fill in "Email" with "wayne.li@berkeley.edu"
  And I fill in "Password" with "12345"
  And I press "Log In"
  Then I should see "Welcome back to Emunah, Wayne."

Scenario: attempt to login as a user that doesn't exist yet
  When I fill in "Email" with "peter.lee@berkeley.com"
  And I fill in "Password" with "whoami"
  And I press "Log In"
  Then I should see "User does not exist."

Scenario: login and create a basic user
  When I fill in "Email" with "seth.martin@gmail.com"
  And I fill in "Password" with "abcde"
  And I press "Log In"
  Then I should see "Welcome back to Emunah, Seth."
  When I press "Create User"
  And I fill in "Email" with "wesley.wan"
  And I fill in "Password" with "helloworld"
  And I fill in "Full Name" with "Wesley Wan"
  And I fill in "Status" with "False"
  And I press "Create User"
  Then I should see "Wesley Wan was successfully created."
