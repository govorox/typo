Feature: Merge Articles
  As a blog administrator
  In order to better organise related articles
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And the following users exist:
        | profile_id | login  | name        | password  | email            | state  |
        | 2          | user_1 | Test User 1 | testpass  | user1@test.local | active |
        | 3          | user_2 | Test User 2 | testpass  | user2@test.local | active |
    And the following articles exist:
        | id | title    | author | user_id | body      | allow_comments | published | published_at        | state     | type    |
        | 3  | Test 1   | user_1 | 2       | Content 1 | true           | true      | 2013-08-01 10:00:00 | published | Article |
        | 4  | Test 2   | user_2 | 3       | Content 2 | true           | true      | 2013-08-10 20:00:00 | published | Article |
    And the following comments exist:
        | id | type    | author | body     | article_id | user_id | created_at |
        | 1  | Comment | user_1 | Comment1 | 3          | 2       | 2013-08-13 |
        | 2  | Comment | user_1 | Comment2 | 4          | 2       | 2013-08-13 |
        | 3  | Comment | user_2 | Comment3 | 3          | 3       | 2013-08-13 |
        | 4  | Comment | user_2 | Comment4 | 4          | 3       | 2013-08-13 |

  # 1
  Scenario: Merge option should be available for Admin
    Given I am logged into the admin panel
    When I go to the edit article page for "Test 1"
    Then I should see "Merge Articles"

  # 2
  Scenario: Merge option should not be available for others
    Given I am logged in as "user_1" with pass "testpass"
    When I go to the edit article page for "Test 1"
    Then I should not see "Merge Articles"
   
  # 3
  Scenario: Admin can merge existing articles
    Given I am logged into the admin panel
    When I go to the edit article page with id "3"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "4"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Articles successfully merged!"

  #4
  Scenario: Error message should be shown when merging fails
    Given I am logged into the admin panel
    When I go to the edit article page with id "3"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "100"
    And I press "Merge"
    Then I should be on the edit article page with id "3"
    And I should see "Articles couldn't be merged"

