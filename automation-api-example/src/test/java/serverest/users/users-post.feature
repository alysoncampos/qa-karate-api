# language:en
# encoding UTF-8

@user_serverest
Feature: Users

    Background:
        * url 'http://localhost:3000'
        * def data = read('classpath:serverest/users/users.yaml')

    @post_users
    Scenario Outline: <cts> -<test_type><system> - Validate post users with status 201 <system>

        * def nome = Java.type('serverest.utils.Utils').getRandomName()
        * def email = Java.type('serverest.utils.Utils').getRandomEmail()

        * def body = data.POST_USERS.body

        Given path '/usuarios'
        And headers headers = data.POST_USERS.headers
        And body.nome = nome
        And body.email = email
        And request body
        When method post
        Then status 201

        And match responseType == 'json'
        And match response.message == data.POST_USERS.message

        @positive
        Examples:
            | cts  | test_type | system      |
            | CT01 | [API]     | [SERVEREST] |


    Scenario Outline: <cts> -<test_type><system> - Validate post users with status 400 <system>

        * def email = Java.type('serverest.utils.Utils').getEmailExists()

        * def body = data.POST_USERS.body

        Given path '/usuarios'
        And headers headers = data.POST_USERS.headers
        And body.email = email
        And request body
        When method post
        Then status 400

        And match responseType == 'json'
        And match response.message == data.POST_USERS.emailExists

        @positive
        Examples:
            | cts  | test_type | system      |
            | CT02 | [API]     | [SERVEREST] |
