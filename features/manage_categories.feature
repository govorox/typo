Feature: Manage Categories
  As a blog administrator
  In order to organise my articles
  I want to be able to add and manage categorieses of blog

  Background:
    Given the blog is set up
    #And I am logged into the admin panel
    
  Scenario: See Categories page
    Given I am logged into the admin panel
    When I follow "Categories"
    Then I should be on the new category page
    And I should see "Categories"
    
  #Scenario: Successfully create a new category
  #  Given I am on the new category page
  #  When I fill in "category_name" with "Test Cat"
  #  And I fill in "category_keywords" with "testcat_keyword"
  #  And I press "Save"
  #  #Then I should be on the admin content page
  #  #When I go to the home page
  #  #Then I should see "Foobar"
  #  #When I follow "Foobar"
  #  Then I should see "Test Cat"
