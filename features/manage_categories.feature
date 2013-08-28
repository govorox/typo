Feature: Manage Categories
  As a blog administrator
  In order to organise my articles
  I want to be able to add and manage categorieses of blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    
  Scenario: See Categories page
    When I follow "Categories"
    Then I should be on the new category page
    And I should see "Categories"
    
  Scenario: Successfully create a new category
    Given I am on the new category page
    When I fill in "category_name" with "Test Cat"
    And I fill in "category_keywords" with "testcat,cattest"
    And I press "Save"
    Then I should be on the new category page
    And I should see "Category was successfully saved"
    And I should see "Test Cat"
    And I should see "testcat"
    And I should see "cattest"
