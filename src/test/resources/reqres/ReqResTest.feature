@parallel=false
Feature: Gestión de usuarios ReqRes

    Background:
        * url reqresBaseUrl
        * header Accept = 'application/json'
        * header x-api-key = reqresApiKey
        * def datos = read('classpath:reqres/data/user_payload.json')
        * def userResource = 'users'

    Scenario: Consultar un usuario creado por id
        Given path userResource, datos.userId
        When method get
        Then status 200
        And match response.data.id == datos.userId
        And match response.data.first_name == '#present'

    Scenario: Actualizar datos de un usuario y verificar actualización
        Given path userResource, datos.userId
        And request datos.usuarioActualizado
        When method put
        Then status 200
        And match response.name == datos.usuarioActualizado.name
        And match response.job == datos.usuarioActualizado.job
        Given path userResource, datos.userId
        When method get
        Then status 200

    Scenario: Eliminar un usuario del sistema
        Given path userResource, datos.userId
        When method delete
        Then status 204

    Scenario: Consultar lista completa y verificar que el usuario no existe
        Given path userResource
        And param page = 2
        When method get
        Then status 200
        And match response.data[*].id !contains datos.userId
        And match response._meta.context == 'legacy_success'