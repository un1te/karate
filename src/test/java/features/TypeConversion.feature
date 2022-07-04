Feature:

  Scenario: Number to string
    * def foo = 10
    * match foo+'' == '10'


  Scenario: String to Number
    * def foo = '10'
    * match foo*1 == 10
    * match parseInt(foo) == 10

