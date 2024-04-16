Feature: Validate the User details from the API

  Background: Endpoint Configuration
    Given The endpoint is already configured

  @user @positive
  Scenario: Enter a valid userId
    When I input a valid userId "1"
    Then I should have the status code "200"
    And content type should be in "JSON" format
    And the body response content should be matched
      | key      | value                 |
      | id       | 1                     |
      | name     | Leanne Graham         |
      | username | Bret                  |
      | email    | Sincere@april.biz     |
      | phone    | 1-770-736-8031 x56442 |
      | website  | hildegard.org         |

  @user @positive
  Scenario: Enter a valid userId
    When I input a valid userId "2"
    Then I should have the status code "200"
    And content type should be in "JSON" format
    And the body response content should be matched
      | key      | value               |
      | id       | 2                   |
      | name     | Ervin Howell        |
      | username | Antonette           |
      | email    | Shanna@melissa.tv   |
      | phone    | 010-692-6593 x09125 |
      | website  | anastasia.net       |

  @user @negative
  Scenario: Enter an invalid UserId
    When I input a valid userId "25"
    Then I should have the status code "404"

  @user
  Scenario: User cannot update posts/comments made by other users
    Given a user
    And a post/comment made by another user
    When the user tries to update the post/comment
    Then an error should be returned indicating permission denied


  @post
  Scenario: User makes a post
    When I input a valid userId "1"
    When the user makes a post with title "My first post" and body "This is my first post on the social network"
    Then the post should be created successfully

  @comment
  Scenario: User comments on a post
    When I input a valid userId "1"
    When the user comments on the post with body "Amazing post , Thank you!"
    Then the comment should be added successfully

  @post
  Scenario: User can make a post
    Given a user
    When the user makes a post
    Then the post should be created successfully

  @comment
  Scenario: User can comment on a post
    Given a user
    And a post
    When the user comments on the post
    Then the comment should be added successfully

  @post
  Scenario: User can view all posts
    Given a user
    When the user views all posts
    Then all posts should be retrieved successfully

  @post
  Scenario: User can view a specific post
    Given a user
    And a post
    When the user views a specific post
    Then the post details should be retrieved successfully

  @comment
  Scenario: User can view comments on a post
    Given a user
    And a post with comments
    When the user views comments on the post
    Then all comments should be retrieved successfully

  @post
  Scenario: User can delete their own post
    Given a user
    And a post created by the user
    When the user deletes the post
    Then the post should be deleted successfully

  @comment
  Scenario: User can delete their own comment
    Given a user
    And a comment made by the user
    When the user deletes the comment
    Then the comment should be deleted successfully

  @comment
  Scenario: User cannot delete posts/comments made by other users
    Given a user
    And a post/comment made by another user
    When the user tries to delete the post/comment
    Then an error should be returned indicating permission denied

  @post
  Scenario: User can update their own post
    Given a user
    And a post created by the user
    When the user updates the post
    Then the post should be updated successfully

  @comment
  Scenario: User can update their own comment
    Given a user
    And a comment made by the user
    When the user updates the comment
    Then the comment should be updated successfully

