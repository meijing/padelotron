Feature: Track team's and players game stats confirmating the result of a game

  In order track the historic of games won/lost and other usefull info about me and my teams
  As a Player and team member
  I want to know the games I've played, how many victories, losses, etc

  Background: Existing players "player1/1a@a.com", "player2/2@a.com", "player3/3@a.com" and "player4/4@a.com",
  existing confirmed team "team1" and "team2", existing confirmed game results:
    Given 4 players exist
    And the following confirmed teams exist:
        |name | player1        | player2        |
        |team1| the 1st player | the 2nd player |
        |team2| the 3rd player | the 4th player |
        |team3| the 1st player | the 3rd player |
        |team4| the 2nd player | the 4th player |

    And the following games already played:
        |desc | team1        | team2        | set 1 | set 2 | set 2 |
        |game1| the 1st team | the 2nd team |  6-1  |  4-6  |  6-2  |
        |game2| the 3rd team | the 4th team |  6-4  |  4-6  |  6-1  |
        |game3| the 2nd team | the 3rd team |  0-6  |  6-1  |  4-6  |
    And the following confirmed friendly games exist:
        | desc | team1         | team2        | play_date |
        | game4 | the 1st team | the 4th team | 2011-8-10 |
        | game5 | the 2nd team | the 3rd team | 2011-8-10 |
        | game6 | the 2nd team | the 4th team | 2011-8-10 |
        | game7 | the 1st team | the 3rd team | 2011-8-10 |

  Scenario Outline: Calculate Game stats for the following Games played between teams:
    Given a result of "<result_sets>" for the game "<game_desc>"
    When I go to the "<first_team>"'s page
    Then I should see 'Ganados: "<team1_won>"'
    And I should see 'Perdidos: "<team1_lost>"'

    When I go to the "<second_team>"'s page
    Then I should see 'Ganados: "<second_won>"'
    And I should see 'Perdidos: "<second_lost>"'

    #Current score win/lost: Team1 => 1/0; Team2 => 0/2; Team3 => 2/0; Team4 => 0/1 ;

@wip
  Scenarios: Victories of Game4 => 1, Game5 => 2, Game3 => 2, Game3 => 1,
        | desc  | result_sets  | team1_won | team1_lost | team2_won | team2_lost |
        | game4 | 6-1/4-6/6-2  | 2         | 0          | 0         | 2          |
        | game5 | 6-1/4-6/6-2  | 1         | 2          | 2         | 1          |
        | game6 | 6-1/4-6/6-2  | 2         | 1          | 2         | 1          |
        | game7 | 6-1/4-6/6-2  | 2         | 1          | 2         | 1          |

  Scenarios: Victories of Game4 => 4, Game5 => 3, Game3 => 4, Game3 => 4,
        | desc  | result_sets  | team1_won | team1_lost | team2_won | team2_lost |
        | game4 | 6-1/4-6/2-6  | 1         | 1          | 1         | 1          |
        | game5 | 6-1/4-6/2-6  | 0         | 3          | 3         | 0          |
        | game6 | 6-1/4-6/2-6  | 1         | 0          | 3         | 0          |
        | game7 | 6-1/4-6/2-6  | 1         | 0          | 3         | 0          |

  Scenarios: Victories of Game4 => 1, Game5 => 3, Game3 => 2, Game3 => 4,
        | desc  | result_sets  | team1_won | team1_lost | team2_won | team2_lost |
        | game4 | 6-1/4-6/6-2  | 2         | 0          | 0         | 2          |
        | game5 | 6-1/4-6/2-6  | 0         | 3          | 3         | 0          |
        | game6 | 6-1/4-6/6-2  | 2         | 1          | 2         | 1          |
        | game7 | 6-1/4-6/2-6  | 1         | 0          | 3         | 0          |